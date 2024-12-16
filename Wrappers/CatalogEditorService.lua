--[[

	Name: CatalogEditorService.lua
	Date: 16/12/24
	Author: cosinewaves
	
	Description: Wrapper for CatalogEditorService.SearchCatalog(), assists in getting catalog items directly without hassle.
	Documentation: https://developer.roblox.com/en-us/api-reference/function/CatalogEditorService/SearchCatalog

]]

return function (CIS_PARAMS: (CatalogSearchParams | "Default")?): ({any})?
	return game:GetService("AvatarEditorService"):SearchCatalog(CatalogSearchParams.new({
		AssetTypes = CIS_PARAMS and CIS_PARAMS.AssetTypes or {Enum.AvatarAssetType.Hat},
		CreatorName = CIS_PARAMS and CIS_PARAMS.CreatorName or "ROBLOX",
		IncludeOffSale = CIS_PARAMS and CIS_PARAMS.IncludeOffSale or false,
		SortType = CIS_PARAMS and CIS_PARAMS.SortType or Enum.CatalogSortType:GetEnumItems()[2],
		SalesTypeFilter = CIS_PARAMS and CIS_PARAMS.SalesTypeFilter or Enum.SalesTypeFilter:GetEnumItems()[2],
		Limit = CIS_PARAMS and CIS_PARAMS.Limit or 60
	})):GetCurrentPage() or nil
end
