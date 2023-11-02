Dockerfile - Sets up all the prereqs for SEAL, Palisade

clonefiles: 
clones all the repos

runmeafterclone.sh
Builds everything

Note that a small change should be made to the Palisade google-benchmark files - benchmark_register.h does NOT have \<limits\> included which means that any numeric_limits reference will give you an error while building - this limits me from including all the repos in the Dockerfile itself  (which is not a very good idea in the first place - don't want a gigantic Docker image)

.gitignore files:
These have the repo files that do not need to be here