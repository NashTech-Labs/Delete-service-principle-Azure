
#list the service principle

az ad sp show --id 81202417-4a52-4246-82cb-bc80ae2b5de9 -otable | sed 's/\|/ /'|awk '{print $3}' | awk '/^AppDisplayName|^-----|^AppDisplayName/ {next}{for (i=1;i<=NF;i++){print $i}}' > sp-list.txt

echo "Enter service app name "
read serviceapp

echo "Enter app id"
read appid

#Cli command to delete the  service principle
echo "====Checking service principle exists or not====="
  if grep -w -i $serviceapp sp-list.txt
   then
    echo "Hooray!!It's available"
   az ad sp delete --id $appid
   rm sp-list.txt
fi
   rm sp-list.txt
