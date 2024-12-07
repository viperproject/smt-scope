# Create the 'logs' directory
test -d "../logs" || mkdir "../logs"

# Loop through all files and check that log exists
for file in $(find test-suite/carbon -name "*.smt2"); do
    echo "Processing \"$file\""
    test -f "$file" || break
    # Get the file hash
    file_hash=$(shasum -a 256 "$file" | cut -d' ' -f1)
    # Get the filename without extension
    base_name=$(basename "${file%.*}")
    # Log file name
    log_file_name="../logs/${base_name}_fHash_${file_hash}.log"
    # Skip if log file exists and is not empty
    test -s "${log_file_name}" && continue || true

    rm -f "../logs/${base_name}_fHash_*.log"
    echo "Processing \"$file\" to \"$log_file_name\""

    # Run Z3 solver for the file and save the log in the 'logs' directory.
    # The memory limit is set to 15.5GB and the timeout is set to 30 seconds
    # (this limits the log file size to roughly <=4GB). We redirect
    # the output so that it doesn't get printed and listen for a
    # timeout message in which case we remove the last line of the log
    # file since it may be incomplete (and cause parsing errors).
    /Users/jfiala/Downloads/z3-z3-4.8.7/build/z3 trace=true proof=true -memory:15872 -T:10 trace-file-name=${log_file_name} ./$file
    
    test -s "${log_file_name}" || echo "!!! Log file not created for \"$file\""
done
