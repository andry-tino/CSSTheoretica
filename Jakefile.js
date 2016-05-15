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
  
  // Tasks
  desc("Compiles all source files.");
  task("default", function() {
    console.log("Compiling files:", (function(s) {
      var out = [];
      for (var key in s) out.push(path.basename(s[key]));
      return out;
    })(sources));
    
    compile();
    
    // Move output files from src to out
    console.log("Moving output files...");
    moveOutputFiles();
    
    console.log("Terminated:");
    console.log(output.toString());
  });
  
  desc("Removes output files from source locations and cleans up folders");
  task("cleanup", function() {
    var files = getOutputFiles();
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
  
  // Private functions
  function compile() {
    // Compilation arguments
    var arguments = ["-structure", "-c"];
    
    // Provided: path to `mosmlc`
    // TODO: var compilerPath = process.env.pathToCompiler;
    var compilerPath = path.join("C:", "Program Files (x86)", "mosml", "bin");
    var compiler = "mosmlc.exe";
    
    // Checking paths
    if (!compilerPath) fail("Invalid path!");
    fs.accessSync(compilerPath, fs.F_OK);
    
    console.log("Compiling with command:", compilerPath);
    console.log("Compiling with args:", arguments);
    
    try {
      var output = execFile(path.join(compilerPath, compiler), 
        arguments.concat(sources));
    } catch(e) {
      console.log("Error when compiling!")
      console.log(!e 
        ? "No error info available!" 
        : Object.keys(e).length == 0 
          ? "Error object contains no data!" 
          : e.output.toString());
      fail("Compilation failed!");
    }
    
    console.log("Compilation done!");
  }
  
  function moveOutputFiles() {
    var files = getOutputFiles();
    if (files.length === 0) return;
    
    for (var key in files) {
      var oldPath = files[key];
      var newPath = path.join("out", path.basename(oldPath));
      fs.rename(oldPath, newPath);
    }
  }
  
  function getOutputFiles() {
    var files = [];
    files = files.concat(glob("src/*.ui"));
    files = files.concat(glob("src/*.uo"));
    return files;
  }
})();
