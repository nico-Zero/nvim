#! usr/bin/bash
echo -n "message: "
read message

git add . && git commit -m "$message" && git push
