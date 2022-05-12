return {
    root_dir = function (fname)
        local git_root = require("lspconfig").util.find_git_ancestor(fname)
        local pkg_root = require("lspconfig").util.find_package_json_ancestor(fname)

        if git_root then
            return git_root
        elseif pkg_root then
            return pkg_root
        end
    end,
	settings = {
		solidity = {
			packageDefaultDependenciesContractDirectory = "",
			packageDefaultDependenciesDirectory = "node_modules",
			enabledAsYouTypeCompilationErrorCheck = true,
			linter = "solhint",
		},
	},
}
