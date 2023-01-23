#!/usr/bin/env bash

mongoDbDumpsList() {
  local FILES
  FILES=$(find "${WEX_DIR_APP_MONGO_DUMPS}" -maxdepth  1 -exec basename {} \;)

  # Initialize an empty array
  FILES_TO_KEEP=()

  # Loop through each file
  for FILE in ${FILES[@]}; do
      # Check if the file is a directory or ends with .zip
      if [ -d "${WEX_DIR_APP_MONGO_DUMPS}/${FILE}" ] || [[ ${FILE} =~ \.zip$ ]]; then
          FILES_TO_KEEP+=(${FILE})
      fi
  done

  printf "%s\n" "${FILES_TO_KEEP[@]}"
}
