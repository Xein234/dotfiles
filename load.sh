#most of the time we need root permission to
#move and change permission/ownership
if [ $UID != 0 ]; then
   echo Non root user. Please run as root. >&2
   exit 1
fi

backupDir=".backupDir/"
for file in "$@"
do
   if [ -a "$file" ];then
      case $file in
         # bash.bashrc) echo '/etc/bash.bashrc';;
         ro) mapped="$PWD/test/ro";;
         "a b") mapped="$PWD/test/a b";;
         *) echo "unknown path where to load "$file"";;
      esac
      if [ "$PWD/$file" = "$(readlink $mapped)" ]; then
         echo ""$mapped" is a symlink to "$file",
it wheren't backuped, it is not the original."

      else
         [ -a "$mapped" ] && cp -i "$mapped" "$backupDir"
      fi

      if [ -a "$mapped" ];then
         chown --reference="./test/$file" "$file"
         chmod --reference="./test/$file" "$file"
      else
         echo "WARNING: $mapped does not exist,
ownership and permissions wheren't copied"

      fi
      ln -sf "$PWD/$file" "$mapped"
   else
      echo "$file does not exist in this directory, skiping it"
   fi
done
#backup or #backUp?
#TODO: error if mapped does not exist
#TODO: reload procedures assingning a func inside case and running it later
#TODO: test for errors if the files contain spaces
