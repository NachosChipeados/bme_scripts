function main()
{
	Globalize( AddAnimAlias )
	Globalize( GetAnimFromAlias )
	Globalize( VerifyAnimAlias )

	Globalize( AddAudioAlias ) //Audio Aliases is exactly the same thing as animAlias, except for sound. Also, no concept of animMapping.
	Globalize( GetAudioFromAlias )
	Globalize( VerifyAudioAlias )

	level.animAliases <- {}

	level.animMappings <- {}
	level.animMappings[ "titan_atlas_bronze" ] <- "titan_atlas"

	level.audioAliases <- {}

}

function AddAnimAlias( titanType, alias, animation )
{
	titanType = titanType.tolower()
	alias = alias.tolower()
	animation = animation.tolower()

	if ( !( alias in level.animAliases ) )
	{
		level.animAliases[ alias ] <- {}
	}

	Assert( !( titanType in level.animAliases[ alias ] ), "Already set titanType " + titanType + " in alias " + alias )
	level.animAliases[ alias ][ titanType ] <- animation
}

function GetAnimFromAlias( titanType, alias )
{
	titanType = titanType.tolower()
	alias = alias.tolower()

	if ( titanType in level.animMappings )
		titanType = level.animMappings[ titanType ]

	Assert( alias in level.animAliases, alias + " is not in level.animAliases" )
	Assert( titanType in level.animAliases[ alias ], titanType + " is not in level.animAliases for that alias" )

	return level.animAliases[ alias ][ titanType ]
}

function VerifyAnimAlias( alias )
{
	alias = alias.tolower()
	Assert( alias in level.animAliases, alias + " is not in level.animAliases" )

	return alias
}


function AddAudioAlias( titanType, alias, audio )
{
	titanType = titanType.tolower()
	alias = alias.tolower()
	audio = audio.tolower()

	if ( !( alias in level.audioAliases ) )
	{
		level.audioAliases[ alias ] <- {}
	}

	Assert( !( titanType in level.audioAliases[ alias ] ), "Already set titanType " + titanType + " in alias " + alias )
	level.audioAliases[ alias ][ titanType ] <- audio
}

function GetAudioFromAlias( titanType, alias )
{
	titanType = titanType.tolower()
	alias = alias.tolower()

	Assert( alias in level.audioAliases, alias + " is not in level.audioAliases" )
	Assert( titanType in level.audioAliases[ alias ], titanType + " is not in level.audioAliases for that alias" )

	return level.audioAliases[ alias ][ titanType ]
}

function VerifyAudioAlias( alias )
{
	alias = alias.tolower()
	Assert( alias in level.audioAliases, alias + " is not in level.audioAliases" )

	return alias
}