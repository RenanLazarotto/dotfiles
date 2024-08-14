function git-prune -d "Removes orphan branches"
	echo "Prunning..."
	git fetch -p
	echo "Getting branches to remove..."
	set branches (git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}')

	echo "Removing branches..."
	for branch in $branches;
		git branch -d $branch;
		echo "Branch $branch removed."
	end
	echo "Done!"
end
