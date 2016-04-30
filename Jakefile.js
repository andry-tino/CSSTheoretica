/**
 * Build system.
 */

(function() {
  var fs = require("fs");
  var path = require("path");
  var glob = require("glob").sync;
  var execFile = require("child_process").execFileSync;
  
  // Platform
  var platform = process.platform;
  
  // All sources
  var sources = (function(srcs) {
    var res = [];
    for (var key in srcs) res.push(path.resolve(srcs[key]));
    return res;
  })(glob("src/*.sml").concat(glob("src/*.sig")));
  
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
    
    try {
      var output = execFile(path.join(compilerPath, compiler), 
        ["-structure"].concat(sources));
    } catch(e) {
      console.log("Error when compiling!")
      console.log(e.output.toString());
      fail("Compilation failed!");
    }
    
    console.log("Terminated:");
    console.log(output.toString());
  });
  
  desc("Removes output files from source locations and cleans up folders");
  task("cleanup", function() {
    var files = [];
    files = files.concat(glob("src/*.ui"));
    files = files.concat(glob("src/*.uo"));
    
    console.log("Cleaning up source locations from output files:", files);
    
    for (var key in files) fs.unlinkSync(files[key]);
    
    console.log("Cleanup done!");
  });
  
  // Listeners
  jake.addListener("complete", function() {
    jake.Task["cleanup"].invoke();
  });
  
  jake.addListener("error", function() {
    jake.Task["cleanup"].invoke();
  });
})();
