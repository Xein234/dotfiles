#TODO?: add vervose option (``-v``) that informs every
#action taken by this script. (maybe?)

#most of the time we need root permission to
#move and change permission/ownership.
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
         "a b")
            mapped="$PWD/test/a b"
            reload(){ echo "UwU, reloading "a b""; };;
         *) echo "unknown path where to load "$file"";;
         #TODO: if unknown path where to load "$file", then
         #skip the procedure below
      esac

      echo $(readlink "$mapped")
      if [ "$PWD/$file" = "$(readlink "$mapped")" ]; then
         echo "$mapped" is already a symlink to "$file",\
         it wheren\'t backuped, it is not the original.

      else
         [ -a "$mapped" ] && cp -i "$mapped" "$backupDir"
         #TODO: inform the user why is been prompted and what will happen
      fi

      if [ -a "$mapped" ];then
         chown --reference="./test/$file" "$file"
         chmod --reference="./test/$file" "$file"
      else
         echo WARNING: $mapped does not exist,\
         ownership and permissions wheren\'t copied
      fi

      ln -sf "$PWD/$file" "$mapped"
      reload
   else
      echo "$file does not exist in this directory, skiping it"
   fi
done
#backup or #backUp?
#TODO: error if mapped does not exist
#TODO: reload procedures assingning a func inside case and running it later
#TODO: test for errors if the files contain spaces
