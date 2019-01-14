#TODO?: add vervose option (``-v``) that informs every
#action taken by this script. (maybe?)

#most of the time we need root permission to
#move and change permission/ownership.
#TODO: var names pointer and pointsTo (or  linked and linker) instead of
#now:  mapped ---> file
#TODO: linker ---> linked
if [ $UID != 0 ]; then
   echo Non root user. Please run as root. >&2
   exit 1
fi

backupDir=".backupDir/"
# map () {
# }
for linked in "$@"
do
   if [ -a "$linked" ];then
      case $linked in
         # bash.bashrc) echo '/etc/bash.bashrc';;
         ro) linker="$PWD/test/ro";;

         "a b")
            linker="$PWD/test/a b"
            reload(){ echo "UwU, reloading "a b""; };;

         *) echo "unknown path where to symlink to "$linked"";;
         #TODO: if unknown path where to load "$linked", then
         #skip the procedure below

      esac

      echo "linker links to: $(readlink "$linker")"
      if [ "$(realpath -s "$linked")" = "$(readlink "$linker")" ]; then
         echo "$linker is already a symlink to $linked,"\
              "it wheren't backuped, it is not the original." >&2

      else
         [ -a "$linker" ] && cp -i "$linker" "$backupDir"
         #TODO: inform the user why is been prompted and what will happen
      fi

      if [ -a "$linker" ];then
         chown --reference="$linker" "$linked"
         chmod --reference="$linker" "$linked"
      else
         echo "WARNING: $linker does not exist,"\
              "ownership and permissions wheren't copied" >&2
      fi

      #ln -s requieres absolute paths
      ln -sf "$(realpath -s "$linked")"  "$linker"
      reload
   else
      echo "$linked does not exist in this directory, skiping it"
   fi
done
#backup or #backUp?
#TODO: error if linker does not exist
#TODO: reload procedures assingning a func inside case and running it later
#TODO: test for errors if the files contain spaces
