# si WHOAMI levanta servicio
# sino crash

if [[ -z "${WHOAMI}" ]]; then
  echo "ERROR: WHOAMI is mandatory"
else
  php -S 0.0.0.0:8000
fi