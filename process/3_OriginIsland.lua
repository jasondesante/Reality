-- ProcessId: mei_yRLz7LqCskLSh1_WZ0qbP4wfRqAL7HHFAIV9RM4

-- Fixed
VerseInfo = {
  Parent = 'WLPqzYek-4TnqlL9KELiNz6qbHyilptnYUIRCMPrfTk', -- WeaveWorldProcessId
  Name = 'Origin Island',
  Dimensions = 2,
  ['Render-With'] = '2D-Tile-0',
}

-- Manually defined by the verse owner
VerseParameters = {
  ['2D-Tile-0'] = {
    Version = 0,
    -- Icon for verse that shows up on parents
    Icon = {
      Type = 'Fixed',
      Format = 'PNG',
      TxId = 'todo' -- TxId of a PNG
    },
    -- This is a tileset themed to the overworld of origin island
    Tileset = {
      Type = 'Fixed',
      Format = 'PNG',
      TxId = 'gxNTOop1jamIJQzAvtSB4KgEVdh-eRi56taSgIFtVlM', -- TxId of the tileset in PNG format
    },
    -- This is a tilemap of origin island & building exteriors
    Tilemap = {
      Type = 'Fixed',
      Format = 'TMJ',
      TxId = 'EqC9HS1H0jz_NHb5Zha1oZqoAcNxAPXSCaGLiA1kjzE', -- TxId of the tilemap in TMJ format
    },
  },
}

-- Registered Child verses
-- These can be warped to without any additional confirmation from the User
-- Warps to verses not in this list will require confirmation from the User
-- (The exception being the parent verse, which also can be freely warped to)
VerseRegistry = {
  -- LlamaFedProcessId
  ['_ghCCK1S0B2_vwO6yHBMwcCDTl6Hj6uXA0oyXwFOza4'] = {
    BypassParameters = true, -- Does not inherit `VerseParametersInherit`
  },
  ['SomeOtherProcessId'] = {
    -- BypassParameters = false, -- By default inherit `VerseParametersInherit`?
  },
}

-- These are the parameters that child verses inherits by default
-- This is in addition to any passed down from parent verses
VerseInherit = {
  Info = {
    -- This will limit the dimensions for children verse to 2
    Dimensions = 2,
    -- This will restrict the renderer to the same as Origin Island
    ['Render-With'] = '2D-Tile-0',
  },
  Parameters = {
    -- This will limit the range where entities can exist, and also player movement for the client
    Positions = {
      Lower = { -14, -10 },
      Upper = { 14, 10 },
    },
    ['2D-Tile-0'] = {
      Version = 0,
      -- This is a tileset themed to building **interiors** in origin island
      Tileset = {
        Type = 'Fixed',
        Format = 'PNG',
        TxId = 'gxNTOop1jamIJQzAvtSB4KgEVdh-eRi56taSgIFtVlM', -- TxId of the interiors tileset in PNG format
      },
    },
  },
}

-- Updated by player actions
VerseEntities = {
  -- WeaveWorldProcess
  ['WLPqzYek-4TnqlL9KELiNz6qbHyilptnYUIRCMPrfTk'] = {
    Position = { 0, 0 },
    Type = 'Warp', -- understood by `2D-Tile-0` renderer
  },
  -- LlamaFedProcess
  ['_ghCCK1S0B2_vwO6yHBMwcCDTl6Hj6uXA0oyXwFOza4'] = {
    Position = { 2, 2 },
    Type = 'Warp', -- understood by `2D-Tile-0` renderer
  },
  ['SomePlayerProcessId'] = {
    Position = { 0, 0 },
    Type = 'Avatar',
  },
  ['SomeBotProcessId'] = {
    Position = { 0, 0 },
    Type = 'Avatar',
  },
}

-- TODO: Purchasing buildings