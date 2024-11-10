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

		params ??= defaultDevString();

		params.prototype ??= true;
		params.uncommitChanges ??= true;

        #if debug
        return  ' ( ${!params.prototype ? '' : 'PROTOTYPE | ' }${GIT_BRANCH}/${GIT_COMMIT}${GIT_LOCALCHANGES && params.uncommitChanges ? ' [$warningSymbol UNCOMMIT CHANGES $warningSymbol] ' : ' '})';
        #else
        return '';
        #end
    }

	public static function defaultDevString():DevString {
		return {
			prototype: true,
			uncommitChanges:true
		}
	}
}

typedef DevString =
{

	@:optional
	public var prototype:Bool;

	@:optional
	public var uncommitChanges:Bool;

}