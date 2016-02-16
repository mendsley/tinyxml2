require "msvc_xp"

workspace "tinyxml2"
	platforms {"x86", "x64"}
	configurations {"Release", "Release-static"}

	location (".build/projects/" .. _ACTION .. "/")
	objdir (".build/obj/"  .. _ACTION .. "/")
	targetdir ("lib/" .. _ACTION .. "/%{cfg.architecture}/")

	debugformat "c7"
	editandcontinue "Off"
	nativewchar "on"
	optimize "Speed"

	flags {
		"NoMinimalRebuild",
		"NoPCH",
		"Symbols",
		"Unicode",
		"FatalWarnings",
	}

	filter "Release-static"
		targetsuffix "-static"
		flags {
			"StaticRuntime",
		}

project "tinyxml2"
	language "C++"
	kind "StaticLib"

	files {
		"tinyxml2.h",
		"tinyxml2.cpp",
	}
