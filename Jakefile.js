/**
 * Build system.
 */

(function() {
  var fs = require("fs");
  var path = require("path");
  var execFile = require("child_process").execFileSync;
  
  // Platform
  var platform = process.platform;
  
  // All sources
  var sources = (function(srcs) {
    var res = [];
    for (var key in srcs) res.push(path.join("src", srcs[key]));
    return res;
  })(fs.readdirSync("src"));
  
  // Provided: path to `mosmlc`
  // TODO: var compilerPath = process.env.pathToCompiler;
  var compilerPath = path.join("C:", "Program Files (x86)", "mosml", "bin");
  var compiler = "mosmlc.exe";
  
  // Tasks
  desc("Compiles all source files.");
  task("default", function() {
    if (!compilerPath) fail("Invalid path!");
    fs.accessSync(compilerPath, fs.F_OK);
    
    console.log("Compiling files:", (function(s) {
      var out = [];
      for (var key in s) out.push(path.basename(s[key]));
      return out;
    })(sources));
    
    var output = execFile(path.join(compilerPath, compiler), sources);
    console.log("Terminated:");
    console.log(output.toString());
  });
  
  desc("Removes output files from source locations and cleans up folders");
  task("cleanup", function() {
    console.log("Cleaning up source locations from output files...");
  });
  
  // Listeners
  jake.addListener("error", function() {
    
  });
})();
