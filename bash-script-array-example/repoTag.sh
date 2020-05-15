IFS=$'\n'
repos=( $(grep repository values.yaml) )
tags=( $(grep tag values.yaml) )
reponames=()
tagnames=()
combinenames=()
#echo "${#repos[@]}"
#echo "${#tags[@]}"
for repo in "${repos[@]}"; do 
repolink=`echo $repo | rev | cut -d":" -f1  | rev`
#echo $repolink
reponames+=( "$repolink" )
done
for tag in "${tags[@]}"; do 
taglink=`echo $tag | rev | cut -d":" -f1  | rev`
#echo $taglink
tagnames+=( "$taglink" )
done
#echo "${reponames[@]}"
#echo "${tagnames[@]}"
for ((i=0; i<${#reponames[@]}; ++i)); do
combinenames+=( "${reponames[$i]}:${tagnames[$i]}" )
done
echo "${combinenames[@]}"
