# echo '$@ -->' $@
# echo '$* -->' $*

#most of the time we need root permission to
#move and change permission/ownership
if [ $UID != 0 ]; then
   echo Non root user. Please run as root. >&2
   exit 1
fi

backupDir=".backupDir/"
for file in $@
do
   case $file in
      # bash.bashrc) echo '/etc/bash.bashrc';;
      ro) mapped="$PWD/test/ro";;
      *) echo "unknown path where to load "$file"";;
   esac
   # echo $PWD/$file
   # echo $(readlink $mapped)
   if [ "$PWD/$file" = "$(readlink $mapped)" ]; then
      echo ""$mapped" is a symlink to "$file",
it won't be backup, it is not the original."

   else
      cp -i "$mapped" "$backupDir"
   fi
   chown --reference="./test/$file" "$file"
   chmod --reference="./test/$file" "$file"
   ln -sf "$PWD/$file" "$mapped"
done
#backup or #backUp?
#TODO: error if mapped does not exist
#TODO: reload procedures assingning a func inside case and running it later
#TODO: test for errors if the files contain spaces
