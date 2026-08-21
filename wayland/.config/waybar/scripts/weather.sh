#!/bin/bash

# TODO: Configure your .env in ~/dotfiles/.env nor change the dir below:
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
if [ -f "$DOTFILES_DIR/.env" ]; then
  source "$DOTFILES_DIR/.env"
else
  echo '{"text":"","class":"error","tooltip":".env file not found"}' | tr -d '\n'
  exit 1
fi

# Validating your env variables
if [ -z "$OPENWEATHER_API_KEY" ] || [ -z "$OPENWEATHER_CITY_ID" ]; then
  echo '{"text":"","class":"error","tooltip":"Incomplete config in .env"}' | tr -d '\n'
  exit 1
fi

UNITS="metric" # Imagine using imperial system lmao.
UNIT_SYMBOL="°C"
LANG="en"

URL="https://api.openweathermap.org/data/2.5/weather?id=${OPENWEATHER_CITY_ID}&appid=${OPENWEATHER_API_KEY}&units=${UNITS}&lang=${LANG}"

# Rest of script remains the same...
WEATHER=$(curl -fsS "$URL") || {
  echo '{"text":"","class":"error","tooltip":"Error fetching weather data"}' | tr -d '\n'
  exit 0
}

TEMP=$(jq -r '.main.temp // empty' <<<"$WEATHER")
ID=$(jq -r '.weather[0].id // 0' <<<"$WEATHER")
DESCRIPTION=$(jq -r '.weather[0].description // empty' <<<"$WEATHER")
HUMIDITY=$(jq -r '.main.humidity // empty' <<<"$WEATHER")
WIND_SPEED=$(jq -r '.wind.speed // empty' <<<"$WEATHER")
FEELS_LIKE=$(jq -r '.main.feels_like // empty' <<<"$WEATHER")

# Get sunrise/sunset data
SUNRISE=$(jq -r '.sys.sunrise' <<<"$WEATHER")
SUNSET=$(jq -r '.sys.sunset' <<<"$WEATHER")
CURRENT_TS=$(date +%s)

# Determine if it's day or night
IS_DAYTIME=0
if ((CURRENT_TS > SUNRISE && CURRENT_TS < SUNSET)); then
  IS_DAYTIME=1
fi

if [[ -z "$TEMP" ]]; then
  echo '{"text":"","class":"error","tooltip":"Weather data unavailable"}' | tr -d '\n'
  exit 0
fi

TEMP_INT=$(printf "%.0f" "$TEMP")

# Determine icon and CSS class based on official codes
if ((ID >= 200 && ID <= 232)); then
  # Thunderstorm (Group 2xx)
  ICON="⛈️"
  CLASS="thunderstorm"
elif ((ID >= 300 && ID <= 321)); then
  # Drizzle (Group 3xx) - day/night drizzle
  if ((IS_DAYTIME)); then ICON="🌦️"; else ICON="🌧️"; fi
  CLASS="drizzle"
elif ((ID >= 500 && ID <= 504)) || ((ID >= 520 && ID <= 531)); then
  # Rain (Group 5xx, excluding special codes)
  ICON="🌧️"
  CLASS="rain"
elif ((ID == 511)); then
  # Freezing rain (special case)
  ICON="❄️🌧️"
  CLASS="freezing-rain"
elif ((ID >= 600 && ID <= 622)); then
  # Snow (Group 6xx)
  ICON="❄️"
  CLASS="snow"
elif ((ID >= 701 && ID <= 781)); then
  # Atmosphere (Group 7xx)
  case $ID in
  701 | 711 | 721 | 731 | 741 | 751 | 761 | 762)
    ICON="🌫️"
    CLASS="fog"
    ;;
  771)
    ICON="🌬️"
    CLASS="squall"
    ;;
  781)
    ICON="🌪️"
    CLASS="tornado"
    ;;
  esac
elif ((ID == 800)); then
  # Clear (800) -- day and night
  if ((IS_DAYTIME)); then ICON="☀️"; else ICON="🌙"; fi
  CLASS="clear"

elif ((ID >= 801 && ID <= 804)); then
  # Clouds
  if ((IS_DAYTIME)); then
    case $ID in
    801) ICON="🌤️" ;; # Few clouds
    802) ICON="⛅" ;;  # Scattered clouds
    *) ICON="☁️" ;;   # Many clouds
    esac
  else
    case $ID in
    801) ICON="🌙☁️" ;; # Few night clouds
    802) ICON="🌌" ;;   # Scattered night clouds (using "milky way")
    *) ICON="☁️" ;;    # Many clouds (same)
    esac
  fi
  CLASS="clouds"
else
  ICON="❓"
  CLASS="unknown"
fi

TOOLTIP=$'<b>'${DESCRIPTION^}$'</b>\nTemperature: '${TEMP_INT}${UNIT_SYMBOL}$' (Feels like: '${FEELS_LIKE%.*}${UNIT_SYMBOL}$')\nHumidity: '${HUMIDITY}$'%\nWind: '${WIND_SPEED}$' km/h'

# Generate JSON using jq to handle special characters correctly
jq -n \
  --arg text "${ICON} ${TEMP_INT}${UNIT_SYMBOL}" \
  --arg class "$CLASS" \
  --arg tooltip "$TOOLTIP" \
  '{text:$text, class:$class, tooltip:$tooltip}' | tr -d '\n'
