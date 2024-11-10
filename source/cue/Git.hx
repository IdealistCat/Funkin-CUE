package cue;

import funkin.util.macro.GitCommit;

class Git
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
        return  '( ${GIT_BRANCH} : ${GIT_HASH}${GIT_HAS_LOCAL_CHANGES ? ' : MODIFIED' : ''})'
        #else
        return '';
        #end
    }
}
