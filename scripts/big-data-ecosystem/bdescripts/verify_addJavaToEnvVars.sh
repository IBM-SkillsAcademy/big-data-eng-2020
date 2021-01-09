if [[ "${JAVA_HOME}" == *"/usr/jdk64"* ]]; then 
  echo "JAVA_HOME found"
else 
  echo "JAVA_HOME not found"
  exit 1
fi

if [[ "${PATH}" == *"$JAVA_HOME"* ]]; then 
  echo "JAVA bin found in path"
else 
  echo "JAVA bin not found"
  exit 1
fi