#!/bin/bash

content=`clipster -o -n $BLOCK_INSTANCE | tail -n1`;

if [ ${#content} -gt 0 ]; then

  case $BLOCK_BUTTON in
    1)
      previous=`clipster -o -n $(($BLOCK_INSTANCE + 1)) | tail -n1`;
      echo "$previous $content" | tr -d '\n' | clipster
      ;;
  esac

  if [ ${#content} -gt 30 ]; then
    content="${content:0:20}...${content: -10}"
  fi

  echo "$content"

else
  echo "#empty#"
fi
