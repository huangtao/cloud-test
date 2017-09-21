var watch = require('watch')
watch.createMonitor('/tmp', function (monitor) {
    //monitor.files['/home/mikeal/.zshrc'] // Stat object for my zshrc.
    monitor.on("created", function (f, stat) {
        // Handle new files
        console.log('created')
    })
    monitor.on("changed", function (f, curr, prev) {
        // Handle file changes
        console.log('changes')
    })
    monitor.on("removed", function (f, stat) {
        // Handle removed files
        console.log('removed')
    })
    monitor.stop(); // Stop watching
})
