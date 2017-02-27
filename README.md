# OmniAuth Groove Music

This gem contains the unofficial Groove Music strategy for OmniAuth.

## Basic Usage

	use OmniAuth::Builder do
		provider :groove_music, <Microsoft Application Client ID>, <Microsoft Application Password>
	end

Create Microsoft Applications at https://apps.dev.microsoft.com

Then register an Application with the Groove API at https://developer.microsoft.com/en-us/dashboard/groove
