function cleanup() {
    global_info "Cleaning up..."
    rm -f "$tmp_counter_file"
    global_info "Clean-up done!"
    exit 1
}

function step_finished() {
    current_step=$(<"$tmp_counter_file")
    current_step=$((current_step + 1))
    echo $current_step > "$tmp_counter_file"
    global_info "Step $current_step/$total_steps done"
}

# Managing a counter through a temp file, as we are dealing with subshells here.
total_steps=$1
tmp_counter_file=$(mktemp)
echo 0 > "$tmp_counter_file"
trap cleanup EXIT SIGINT SIGTERM