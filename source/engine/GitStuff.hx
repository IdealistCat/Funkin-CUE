package engine;

import funkin.util.macro.GitCommit;

class GitStuff
{
	/**
	 * Git commit
	 */
	public static var GIT_COMMIT:String = GitCommit.getGitCommitHash();

	/**
	 * Git branch
	 */
	public static var GIT_BRANCH:String = GitCommit.getGitBranch();

	/**
	 * Git local changes
	 */
	public static var GIT_LOCALCHANGES:Bool = GitCommit.getGitHasLocalChanges();

	public static var warningSymbol:String = "/!\\";

    public static function developmentString(?params:DevString)
    {
        #if debug
        return  '( ${params.prototype ? 'PROTOTYPE | ' : '' }${GIT_BRANCH}/${GIT_COMMIT}${GIT_LOCALCHANGES && params.uncommitChanges ? ' [$warningSymbol UNCOMMIT CHANGES $warningSymbol] ' : ' '})';
        #else
        return '';
        #end
    }
}

typedef DevString = {

	@default(true)
	@:optional
	var prototype:Bool;

	@default(true)
	@:optional
	var uncommitChanges:Bool;
}