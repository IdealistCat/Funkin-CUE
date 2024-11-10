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

    public static function developmentString()
    {
        #if debug
        return  '( ${GIT_BRANCH} : ${GIT_COMMIT}${GIT_LOCALCHANGES ? ' : MODIFIED' : ''})'
        #else
        return '';
        #end
    }
}
