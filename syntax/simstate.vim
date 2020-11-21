" Vim syntax file
" Language:	simstate state file
" Maintainer:	Andrew Meadows <andrew@lindenlab.com>
" Last Change:	2004 May 1
"

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
    syn clear
elseif exists("b:current_syntax")
    finish
endif

" simstate files are case sensitive
syn case match

syn match savComment /#.*$/

syn match savHeader /^version\s/
syn match savHeader /^written\s/

syn match savRegion /^grid\s/
syn match savRegion /^name\s/
syn match savRegion /^region_id\s/
syn match savRegion /^estate_id\s/

syn match savRegion /^cache_id\s/
syn match savRegion /^price_land_claim\s/
syn match savRegion /^max_agents\s/
syn match savRegion /^max_objects\s/

syn match savFlag /^allow_damage\s/
syn match savFlag /^allow_landmark\s/
syn match savFlag /^allow_set_home\s/
syn match savFlag /^reset_home_on_teleport\s/
syn match savFlag /^sun_fixed\s/
syn match savFlag /^block_dwell\s/

syn match savRegion /^water_height\s/
syn match savTexture /^texturebase\s/
syn match savTexture /^texturedetail\s/
syn match savTexture /^texturestartheight\s/
syn match savTexture /^textureheightrange\s/
syn match savRegion /^sim_access\s/

syn match savFlag /^tax_free\s/
syn match savFlag /^block_terraform\s/
syn match savFlag /^block_terrafrom\s/
syn match savFlag /^block_land_transfer\s/
syn match savFlag /^externally_visible\s/
syn match savFlag /^mainland_visible\s/
syn match savFlag /^block_show_on_map\s/
syn match savFlag /^skip_scripts\s/
syn match savFlag /^sandbox\s/

syn match savRegion /^sandbox_cleaned\s/
syn match savRegion /^sandbox_cleaned_hour\s/
syn match savRegion /^next_map_dump_seconds\s/
syn match savRegion /^next_local_id\s/
syn match savRegion /^parcel_billable_factor\s/
syn match savRegion /^parcel_object_bonus\s/
syn match savRegion /^terrain_raise_limit\s/
syn match savRegion /^terrain_lower_limit\s/
syn match savRegion /^layers\s/
syn match savRegion /^tasks\s/

syn match savLayer /^layer\s/
syn match savParcel /^parcels/
syn match savDwell /^dwell/
syn match savTelehub /^telehub/

" parcel stuff
syn match savParcel /^\s\+parcel_id/
syn match savParcel /^\s\+status/
syn match savParcel /^\s\+category/
syn match savParcel /^\s\+local_id/
syn match savParcel /^\s\+name/
syn match savParcel /^\s\+desc/
syn match savParcel /^\s\+music_url/
syn match savFlag /^\s\+group_owned/
syn match savFlag /^\s\+allow_modify/
syn match savFlag /^\s\+allow_terraform/
syn match savFlag /^\s\+allow_deed_to_group/
syn match savFlag /^\s\+contribute_with_deed/
syn match savFlag /^\s\+allow_damage/
syn match savFlag /^\s\+allow_fly/
syn match savFlag /^\s\+allow_landmark/
syn match savFlag /^\s\+sound_local/
syn match savFlag /^\s\+allow_scripts/
syn match savFlag /^\s\+for_sale/
syn match savFlag /^\s\+use_access_group/
syn match savFlag /^\s\+use_access_list/
syn match savFlag /^\s\+use_ban_list/
syn match savFlag /^\s\+use_pass_list/
syn match savFlag /^\s\+show_directory/
syn match savParcel /^\s\+clean_other_time/
syn match savParcel /^\s\+snapshot_id/
syn match savParcel /^\s\+user_location/
syn match savParcel /^\s\+claim_date/
syn match savParcel /^\s\+claim_price/
syn match savParcel /^\s\+rent_price/
syn match savParcel /^\s\+discount_rate/
syn match savParcel /^\s\+draw_distance/
syn match savParcel /^\s\+sale_price/
syn match savParcel /^\s\+draw_distance/
syn match savParcel /^\s\+pass_price/
syn match savParcel /^\s\+pass_hours/
syn match savParcel /^\s\+aabb_min/
syn match savParcel /^\s\+access_list/
syn match savParcel /^\s\+time/
syn match savFlag /^\s\+flags/

syn match savTask /^task\s/
"7833cdf0-55fd-6051-7e17-7e884cf3baa4
syn match savUUID /\x\{8}-\x\{4}-\x\{4}-\x\{4}-\x\{12}/
syn match savMask /\s\+\x\{8}\s*$/

syn match savPermissions /^\s\+permissions\s\d/
syn match savMaskName /^\s\+\a\+_mask/
syn match savMaskName /^\s\+\a\+_\a\+_mask/
syn match savOwner /^\s\+creator_id\s/
syn match savOwner /^\s\+owner_id\s/
syn match savOwner /^\s\+last_owner_id\s/
syn match savOwner /^\s\+group_id\s/

syn match savShape /^\sshape\s/

syn match savPath /^\s\+path/
syn match savPath /^\s\+curve/
syn match savPath /^\s\+begin/
syn match savPath /^\s\+end/
syn match savPath /^\s\+scale_[xy]/
syn match savPath /^\s\+shear_[xy]/
syn match savPath /^\s\+twist\s/
syn match savPath /^\s\+twist_begin\s/
syn match savPath /^\s\+twist_end\s/
syn match savPath /^\s\+radius_offset/
syn match savPath /^\s\+taper_[xy]/
syn match savPath /^\s\+revolutions/
syn match savPath /^\s\+skew/

syn match savProfile /^\s\+profile/
"syn match savProfile /^\s\+curve/
"syn match savProfile /^\s\+begin/
"syn match savProfile /^\s\+end/
syn match savProfile /^\s\+hollow/

syn match savImage /^\sfaces\s/
syn match savImage /^\s.imageid\s/
syn match savImage /^\s.colors\s/
syn match savImage /^\s.scales\s/
syn match savImage /^\s.scalet\s/
syn match savImage /^\s.offsets\s/
syn match savImage /^\s.offsett\s/
syn match savImage /^\s.imagerot\s/
syn match savImage /^\s.bump\s/

syn match savTaskName /\sname\s*.*|$/

syn match savSaleInfo /^\ssale_info\s/
syn match savSaleInfo /^\ssale_type\s/
syn match savSaleInfo /^\ssale_price\s/

syn match savPreLink /^\spre_link_base_mask/
syn match savLinkInfo /^\slinked\s*child\|^\slinked\s*linked/

if version >= 508 || !exists("did_config_syntax_inits")
  if version < 508
    let did_config_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

" the assume use three we have six non-standard colors at our disposal
"   Comment 
"   Constant
"   Special 
"   Keyword 
"   Identifier 
"   Structure

  HiLink savComment Comment

  HiLink savTask Keyword
  HiLink savUUID Number
  HiLink savMask Number

  HiLink savHeader Special
  HiLink savRegion StorageClass
  HiLink savParcel StorageClass
  HiLink savFlag Special
  HiLink savTexture StorageClass
  HiLink savLayer Special
  HiLink savDwell Special
  HiLink savTelehub Special
  HiLink savPermissions Keyword
  HiLink savMaskName Special
  HiLink savOwner Identifier

  HiLink savShape Keyword
  HiLink savImage Keyword
  HiLink savSaleInfo Keyword

  HiLink savTaskName Special
  HiLink savPreLink Special
  HiLink savLinkInfo Special

  HiLink savPath Keyword
  HiLink savProfile Identifier

  delcommand HiLink
endif

let b:current_syntax = "simstate"
" vim: sts=4 sw=4 ts=8
