{-# OPTIONS_GHC -w #-}
module PseudocodeParser (parsePSC) where
import Ast
import Tokens
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

data HappyAbsSyn 
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 (Program)
	| HappyAbsSyn5 (Block)
	| HappyAbsSyn7 (Statement)
	| HappyAbsSyn8 ([String])
	| HappyAbsSyn11 (Expression)
	| HappyAbsSyn16 ([Expression])

{- to allow type-synonyms as our monads (likely
 - with explicitly-specified bind and return)
 - in Haskell98, it seems that with
 - /type M a = .../, then /(HappyReduction M)/
 - is not allowed.  But Happy is a
 - code-generator that can just substitute it.
type HappyReduction m = 
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> m HappyAbsSyn
-}

action_0,
 action_1,
 action_2,
 action_3,
 action_4,
 action_5,
 action_6,
 action_7,
 action_8,
 action_9,
 action_10,
 action_11,
 action_12,
 action_13,
 action_14,
 action_15,
 action_16,
 action_17,
 action_18,
 action_19,
 action_20,
 action_21,
 action_22,
 action_23,
 action_24,
 action_25,
 action_26,
 action_27,
 action_28,
 action_29,
 action_30,
 action_31,
 action_32,
 action_33,
 action_34,
 action_35,
 action_36,
 action_37,
 action_38,
 action_39,
 action_40,
 action_41,
 action_42,
 action_43,
 action_44,
 action_45,
 action_46,
 action_47,
 action_48,
 action_49,
 action_50,
 action_51,
 action_52,
 action_53,
 action_54,
 action_55,
 action_56,
 action_57,
 action_58,
 action_59,
 action_60,
 action_61,
 action_62,
 action_63,
 action_64,
 action_65,
 action_66,
 action_67,
 action_68,
 action_69,
 action_70,
 action_71,
 action_72,
 action_73,
 action_74,
 action_75,
 action_76,
 action_77,
 action_78,
 action_79,
 action_80,
 action_81,
 action_82,
 action_83,
 action_84,
 action_85,
 action_86,
 action_87,
 action_88,
 action_89,
 action_90,
 action_91,
 action_92,
 action_93,
 action_94,
 action_95,
 action_96,
 action_97,
 action_98,
 action_99,
 action_100,
 action_101,
 action_102,
 action_103,
 action_104,
 action_105,
 action_106,
 action_107,
 action_108,
 action_109,
 action_110,
 action_111,
 action_112 :: () => Int -> ({-HappyReduction (HappyIdentity) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (HappyIdentity) HappyAbsSyn)

happyReduce_1,
 happyReduce_2,
 happyReduce_3,
 happyReduce_4,
 happyReduce_5,
 happyReduce_6,
 happyReduce_7,
 happyReduce_8,
 happyReduce_9,
 happyReduce_10,
 happyReduce_11,
 happyReduce_12,
 happyReduce_13,
 happyReduce_14,
 happyReduce_15,
 happyReduce_16,
 happyReduce_17,
 happyReduce_18,
 happyReduce_19,
 happyReduce_20,
 happyReduce_21,
 happyReduce_22,
 happyReduce_23,
 happyReduce_24,
 happyReduce_25,
 happyReduce_26,
 happyReduce_27,
 happyReduce_28,
 happyReduce_29,
 happyReduce_30,
 happyReduce_31,
 happyReduce_32,
 happyReduce_33,
 happyReduce_34,
 happyReduce_35,
 happyReduce_36,
 happyReduce_37,
 happyReduce_38,
 happyReduce_39,
 happyReduce_40,
 happyReduce_41,
 happyReduce_42,
 happyReduce_43,
 happyReduce_44,
 happyReduce_45,
 happyReduce_46,
 happyReduce_47,
 happyReduce_48,
 happyReduce_49,
 happyReduce_50,
 happyReduce_51 :: () => ({-HappyReduction (HappyIdentity) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (HappyIdentity) HappyAbsSyn)

action_0 (18) = happyShift action_11
action_0 (22) = happyShift action_12
action_0 (25) = happyShift action_13
action_0 (27) = happyShift action_14
action_0 (30) = happyShift action_15
action_0 (31) = happyShift action_16
action_0 (34) = happyShift action_17
action_0 (56) = happyShift action_18
action_0 (57) = happyShift action_19
action_0 (58) = happyShift action_20
action_0 (59) = happyShift action_21
action_0 (4) = happyGoto action_22
action_0 (6) = happyGoto action_2
action_0 (7) = happyGoto action_3
action_0 (9) = happyGoto action_4
action_0 (10) = happyGoto action_5
action_0 (11) = happyGoto action_6
action_0 (12) = happyGoto action_7
action_0 (13) = happyGoto action_8
action_0 (14) = happyGoto action_9
action_0 (15) = happyGoto action_10
action_0 _ = happyFail

action_1 (18) = happyShift action_11
action_1 (22) = happyShift action_12
action_1 (25) = happyShift action_13
action_1 (27) = happyShift action_14
action_1 (30) = happyShift action_15
action_1 (31) = happyShift action_16
action_1 (34) = happyShift action_17
action_1 (56) = happyShift action_18
action_1 (57) = happyShift action_19
action_1 (58) = happyShift action_20
action_1 (59) = happyShift action_21
action_1 (6) = happyGoto action_2
action_1 (7) = happyGoto action_3
action_1 (9) = happyGoto action_4
action_1 (10) = happyGoto action_5
action_1 (11) = happyGoto action_6
action_1 (12) = happyGoto action_7
action_1 (13) = happyGoto action_8
action_1 (14) = happyGoto action_9
action_1 (15) = happyGoto action_10
action_1 _ = happyFail

action_2 (18) = happyShift action_11
action_2 (22) = happyShift action_12
action_2 (25) = happyShift action_13
action_2 (27) = happyShift action_14
action_2 (30) = happyShift action_15
action_2 (31) = happyShift action_16
action_2 (34) = happyShift action_17
action_2 (56) = happyShift action_18
action_2 (57) = happyShift action_19
action_2 (58) = happyShift action_20
action_2 (59) = happyShift action_21
action_2 (7) = happyGoto action_53
action_2 (9) = happyGoto action_4
action_2 (10) = happyGoto action_5
action_2 (11) = happyGoto action_6
action_2 (12) = happyGoto action_7
action_2 (13) = happyGoto action_8
action_2 (14) = happyGoto action_9
action_2 (15) = happyGoto action_10
action_2 _ = happyReduce_1

action_3 _ = happyReduce_5

action_4 _ = happyReduce_7

action_5 _ = happyReduce_8

action_6 (32) = happyShift action_34
action_6 (34) = happyShift action_35
action_6 (38) = happyShift action_36
action_6 (40) = happyShift action_37
action_6 (41) = happyShift action_38
action_6 (42) = happyShift action_39
action_6 (43) = happyShift action_40
action_6 (44) = happyShift action_41
action_6 (45) = happyShift action_42
action_6 (46) = happyShift action_43
action_6 (47) = happyShift action_44
action_6 (48) = happyShift action_45
action_6 (49) = happyShift action_46
action_6 (50) = happyShift action_47
action_6 (51) = happyShift action_48
action_6 (52) = happyShift action_49
action_6 (53) = happyShift action_50
action_6 (54) = happyShift action_51
action_6 (55) = happyShift action_52
action_6 _ = happyFail

action_7 _ = happyReduce_29

action_8 _ = happyReduce_26

action_9 _ = happyReduce_28

action_10 _ = happyReduce_27

action_11 (34) = happyShift action_17
action_11 (56) = happyShift action_18
action_11 (57) = happyShift action_19
action_11 (58) = happyShift action_20
action_11 (59) = happyShift action_21
action_11 (11) = happyGoto action_33
action_11 (12) = happyGoto action_7
action_11 (13) = happyGoto action_8
action_11 (14) = happyGoto action_9
action_11 (15) = happyGoto action_10
action_11 _ = happyFail

action_12 (34) = happyShift action_17
action_12 (56) = happyShift action_18
action_12 (57) = happyShift action_19
action_12 (58) = happyShift action_20
action_12 (59) = happyShift action_21
action_12 (11) = happyGoto action_32
action_12 (12) = happyGoto action_7
action_12 (13) = happyGoto action_8
action_12 (14) = happyGoto action_9
action_12 (15) = happyGoto action_10
action_12 _ = happyFail

action_13 (18) = happyShift action_11
action_13 (22) = happyShift action_12
action_13 (25) = happyShift action_13
action_13 (27) = happyShift action_14
action_13 (30) = happyShift action_15
action_13 (31) = happyShift action_16
action_13 (34) = happyShift action_17
action_13 (36) = happyShift action_31
action_13 (56) = happyShift action_18
action_13 (57) = happyShift action_19
action_13 (58) = happyShift action_20
action_13 (59) = happyShift action_21
action_13 (5) = happyGoto action_29
action_13 (7) = happyGoto action_30
action_13 (9) = happyGoto action_4
action_13 (10) = happyGoto action_5
action_13 (11) = happyGoto action_6
action_13 (12) = happyGoto action_7
action_13 (13) = happyGoto action_8
action_13 (14) = happyGoto action_9
action_13 (15) = happyGoto action_10
action_13 _ = happyReduce_2

action_14 (34) = happyShift action_17
action_14 (56) = happyShift action_18
action_14 (57) = happyShift action_19
action_14 (58) = happyShift action_20
action_14 (59) = happyShift action_21
action_14 (11) = happyGoto action_27
action_14 (12) = happyGoto action_28
action_14 (13) = happyGoto action_8
action_14 (14) = happyGoto action_9
action_14 (15) = happyGoto action_10
action_14 _ = happyFail

action_15 (58) = happyShift action_26
action_15 _ = happyFail

action_16 (34) = happyShift action_17
action_16 (56) = happyShift action_18
action_16 (57) = happyShift action_19
action_16 (58) = happyShift action_20
action_16 (59) = happyShift action_21
action_16 (11) = happyGoto action_25
action_16 (12) = happyGoto action_7
action_16 (13) = happyGoto action_8
action_16 (14) = happyGoto action_9
action_16 (15) = happyGoto action_10
action_16 _ = happyFail

action_17 (34) = happyShift action_17
action_17 (56) = happyShift action_18
action_17 (57) = happyShift action_19
action_17 (58) = happyShift action_20
action_17 (59) = happyShift action_21
action_17 (11) = happyGoto action_24
action_17 (12) = happyGoto action_7
action_17 (13) = happyGoto action_8
action_17 (14) = happyGoto action_9
action_17 (15) = happyGoto action_10
action_17 _ = happyFail

action_18 (34) = happyShift action_17
action_18 (56) = happyShift action_18
action_18 (57) = happyShift action_19
action_18 (58) = happyShift action_20
action_18 (59) = happyShift action_21
action_18 (11) = happyGoto action_23
action_18 (12) = happyGoto action_7
action_18 (13) = happyGoto action_8
action_18 (14) = happyGoto action_9
action_18 (15) = happyGoto action_10
action_18 _ = happyFail

action_19 _ = happyReduce_24

action_20 _ = happyReduce_30

action_21 _ = happyReduce_21

action_22 (60) = happyAccept
action_22 _ = happyFail

action_23 (34) = happyShift action_35
action_23 (38) = happyShift action_36
action_23 (52) = happyShift action_49
action_23 (53) = happyShift action_50
action_23 _ = happyReduce_47

action_24 (34) = happyShift action_35
action_24 (35) = happyShift action_80
action_24 (38) = happyShift action_36
action_24 (40) = happyShift action_37
action_24 (41) = happyShift action_38
action_24 (42) = happyShift action_39
action_24 (43) = happyShift action_40
action_24 (44) = happyShift action_41
action_24 (45) = happyShift action_42
action_24 (46) = happyShift action_43
action_24 (47) = happyShift action_44
action_24 (48) = happyShift action_45
action_24 (49) = happyShift action_46
action_24 (50) = happyShift action_47
action_24 (51) = happyShift action_48
action_24 (52) = happyShift action_49
action_24 (53) = happyShift action_50
action_24 (54) = happyShift action_51
action_24 (55) = happyShift action_52
action_24 _ = happyFail

action_25 (32) = happyShift action_79
action_25 (34) = happyShift action_35
action_25 (38) = happyShift action_36
action_25 (40) = happyShift action_37
action_25 (41) = happyShift action_38
action_25 (42) = happyShift action_39
action_25 (43) = happyShift action_40
action_25 (44) = happyShift action_41
action_25 (45) = happyShift action_42
action_25 (46) = happyShift action_43
action_25 (47) = happyShift action_44
action_25 (48) = happyShift action_45
action_25 (49) = happyShift action_46
action_25 (50) = happyShift action_47
action_25 (51) = happyShift action_48
action_25 (52) = happyShift action_49
action_25 (53) = happyShift action_50
action_25 (54) = happyShift action_51
action_25 (55) = happyShift action_52
action_25 _ = happyFail

action_26 (34) = happyShift action_78
action_26 _ = happyFail

action_27 (34) = happyShift action_35
action_27 (38) = happyShift action_36
action_27 (40) = happyShift action_37
action_27 (41) = happyShift action_38
action_27 (42) = happyShift action_39
action_27 (43) = happyShift action_40
action_27 (44) = happyShift action_41
action_27 (45) = happyShift action_42
action_27 (46) = happyShift action_43
action_27 (47) = happyShift action_44
action_27 (48) = happyShift action_45
action_27 (49) = happyShift action_46
action_27 (50) = happyShift action_47
action_27 (51) = happyShift action_48
action_27 (52) = happyShift action_49
action_27 (53) = happyShift action_50
action_27 (54) = happyShift action_51
action_27 (55) = happyShift action_52
action_27 _ = happyFail

action_28 (28) = happyShift action_76
action_28 (29) = happyShift action_77
action_28 _ = happyReduce_29

action_29 (26) = happyShift action_75
action_29 _ = happyFail

action_30 _ = happyReduce_3

action_31 (18) = happyShift action_11
action_31 (22) = happyShift action_12
action_31 (25) = happyShift action_13
action_31 (27) = happyShift action_14
action_31 (30) = happyShift action_15
action_31 (31) = happyShift action_16
action_31 (34) = happyShift action_17
action_31 (56) = happyShift action_18
action_31 (57) = happyShift action_19
action_31 (58) = happyShift action_20
action_31 (59) = happyShift action_21
action_31 (6) = happyGoto action_74
action_31 (7) = happyGoto action_3
action_31 (9) = happyGoto action_4
action_31 (10) = happyGoto action_5
action_31 (11) = happyGoto action_6
action_31 (12) = happyGoto action_7
action_31 (13) = happyGoto action_8
action_31 (14) = happyGoto action_9
action_31 (15) = happyGoto action_10
action_31 _ = happyFail

action_32 (32) = happyShift action_73
action_32 (34) = happyShift action_35
action_32 (38) = happyShift action_36
action_32 (40) = happyShift action_37
action_32 (41) = happyShift action_38
action_32 (42) = happyShift action_39
action_32 (43) = happyShift action_40
action_32 (44) = happyShift action_41
action_32 (45) = happyShift action_42
action_32 (46) = happyShift action_43
action_32 (47) = happyShift action_44
action_32 (48) = happyShift action_45
action_32 (49) = happyShift action_46
action_32 (50) = happyShift action_47
action_32 (51) = happyShift action_48
action_32 (52) = happyShift action_49
action_32 (53) = happyShift action_50
action_32 (54) = happyShift action_51
action_32 (55) = happyShift action_52
action_32 _ = happyFail

action_33 (32) = happyShift action_72
action_33 (34) = happyShift action_35
action_33 (38) = happyShift action_36
action_33 (40) = happyShift action_37
action_33 (41) = happyShift action_38
action_33 (42) = happyShift action_39
action_33 (43) = happyShift action_40
action_33 (44) = happyShift action_41
action_33 (45) = happyShift action_42
action_33 (46) = happyShift action_43
action_33 (47) = happyShift action_44
action_33 (48) = happyShift action_45
action_33 (49) = happyShift action_46
action_33 (50) = happyShift action_47
action_33 (51) = happyShift action_48
action_33 (52) = happyShift action_49
action_33 (53) = happyShift action_50
action_33 (54) = happyShift action_51
action_33 (55) = happyShift action_52
action_33 _ = happyFail

action_34 _ = happyReduce_11

action_35 (34) = happyShift action_17
action_35 (56) = happyShift action_18
action_35 (57) = happyShift action_19
action_35 (58) = happyShift action_20
action_35 (59) = happyShift action_21
action_35 (11) = happyGoto action_69
action_35 (12) = happyGoto action_7
action_35 (13) = happyGoto action_8
action_35 (14) = happyGoto action_9
action_35 (15) = happyGoto action_10
action_35 (16) = happyGoto action_70
action_35 (17) = happyGoto action_71
action_35 _ = happyReduce_48

action_36 (34) = happyShift action_17
action_36 (56) = happyShift action_18
action_36 (57) = happyShift action_19
action_36 (58) = happyShift action_20
action_36 (59) = happyShift action_21
action_36 (11) = happyGoto action_68
action_36 (12) = happyGoto action_7
action_36 (13) = happyGoto action_8
action_36 (14) = happyGoto action_9
action_36 (15) = happyGoto action_10
action_36 _ = happyFail

action_37 (34) = happyShift action_17
action_37 (56) = happyShift action_18
action_37 (57) = happyShift action_19
action_37 (58) = happyShift action_20
action_37 (59) = happyShift action_21
action_37 (11) = happyGoto action_67
action_37 (12) = happyGoto action_7
action_37 (13) = happyGoto action_8
action_37 (14) = happyGoto action_9
action_37 (15) = happyGoto action_10
action_37 _ = happyFail

action_38 (34) = happyShift action_17
action_38 (56) = happyShift action_18
action_38 (57) = happyShift action_19
action_38 (58) = happyShift action_20
action_38 (59) = happyShift action_21
action_38 (11) = happyGoto action_66
action_38 (12) = happyGoto action_7
action_38 (13) = happyGoto action_8
action_38 (14) = happyGoto action_9
action_38 (15) = happyGoto action_10
action_38 _ = happyFail

action_39 (34) = happyShift action_17
action_39 (56) = happyShift action_18
action_39 (57) = happyShift action_19
action_39 (58) = happyShift action_20
action_39 (59) = happyShift action_21
action_39 (11) = happyGoto action_65
action_39 (12) = happyGoto action_7
action_39 (13) = happyGoto action_8
action_39 (14) = happyGoto action_9
action_39 (15) = happyGoto action_10
action_39 _ = happyFail

action_40 (34) = happyShift action_17
action_40 (56) = happyShift action_18
action_40 (57) = happyShift action_19
action_40 (58) = happyShift action_20
action_40 (59) = happyShift action_21
action_40 (11) = happyGoto action_64
action_40 (12) = happyGoto action_7
action_40 (13) = happyGoto action_8
action_40 (14) = happyGoto action_9
action_40 (15) = happyGoto action_10
action_40 _ = happyFail

action_41 (34) = happyShift action_17
action_41 (56) = happyShift action_18
action_41 (57) = happyShift action_19
action_41 (58) = happyShift action_20
action_41 (59) = happyShift action_21
action_41 (11) = happyGoto action_63
action_41 (12) = happyGoto action_7
action_41 (13) = happyGoto action_8
action_41 (14) = happyGoto action_9
action_41 (15) = happyGoto action_10
action_41 _ = happyFail

action_42 (34) = happyShift action_17
action_42 (56) = happyShift action_18
action_42 (57) = happyShift action_19
action_42 (58) = happyShift action_20
action_42 (59) = happyShift action_21
action_42 (11) = happyGoto action_62
action_42 (12) = happyGoto action_7
action_42 (13) = happyGoto action_8
action_42 (14) = happyGoto action_9
action_42 (15) = happyGoto action_10
action_42 _ = happyFail

action_43 (34) = happyShift action_17
action_43 (56) = happyShift action_18
action_43 (57) = happyShift action_19
action_43 (58) = happyShift action_20
action_43 (59) = happyShift action_21
action_43 (11) = happyGoto action_61
action_43 (12) = happyGoto action_7
action_43 (13) = happyGoto action_8
action_43 (14) = happyGoto action_9
action_43 (15) = happyGoto action_10
action_43 _ = happyFail

action_44 (34) = happyShift action_17
action_44 (56) = happyShift action_18
action_44 (57) = happyShift action_19
action_44 (58) = happyShift action_20
action_44 (59) = happyShift action_21
action_44 (11) = happyGoto action_60
action_44 (12) = happyGoto action_7
action_44 (13) = happyGoto action_8
action_44 (14) = happyGoto action_9
action_44 (15) = happyGoto action_10
action_44 _ = happyFail

action_45 (34) = happyShift action_17
action_45 (56) = happyShift action_18
action_45 (57) = happyShift action_19
action_45 (58) = happyShift action_20
action_45 (59) = happyShift action_21
action_45 (11) = happyGoto action_59
action_45 (12) = happyGoto action_7
action_45 (13) = happyGoto action_8
action_45 (14) = happyGoto action_9
action_45 (15) = happyGoto action_10
action_45 _ = happyFail

action_46 (34) = happyShift action_17
action_46 (56) = happyShift action_18
action_46 (57) = happyShift action_19
action_46 (58) = happyShift action_20
action_46 (59) = happyShift action_21
action_46 (11) = happyGoto action_58
action_46 (12) = happyGoto action_7
action_46 (13) = happyGoto action_8
action_46 (14) = happyGoto action_9
action_46 (15) = happyGoto action_10
action_46 _ = happyFail

action_47 (34) = happyShift action_17
action_47 (56) = happyShift action_18
action_47 (57) = happyShift action_19
action_47 (58) = happyShift action_20
action_47 (59) = happyShift action_21
action_47 (11) = happyGoto action_57
action_47 (12) = happyGoto action_7
action_47 (13) = happyGoto action_8
action_47 (14) = happyGoto action_9
action_47 (15) = happyGoto action_10
action_47 _ = happyFail

action_48 (34) = happyShift action_17
action_48 (56) = happyShift action_18
action_48 (57) = happyShift action_19
action_48 (58) = happyShift action_20
action_48 (59) = happyShift action_21
action_48 (11) = happyGoto action_56
action_48 (12) = happyGoto action_7
action_48 (13) = happyGoto action_8
action_48 (14) = happyGoto action_9
action_48 (15) = happyGoto action_10
action_48 _ = happyFail

action_49 _ = happyReduce_32

action_50 _ = happyReduce_33

action_51 (34) = happyShift action_17
action_51 (56) = happyShift action_18
action_51 (57) = happyShift action_19
action_51 (58) = happyShift action_20
action_51 (59) = happyShift action_21
action_51 (11) = happyGoto action_55
action_51 (12) = happyGoto action_7
action_51 (13) = happyGoto action_8
action_51 (14) = happyGoto action_9
action_51 (15) = happyGoto action_10
action_51 _ = happyFail

action_52 (34) = happyShift action_17
action_52 (56) = happyShift action_18
action_52 (57) = happyShift action_19
action_52 (58) = happyShift action_20
action_52 (59) = happyShift action_21
action_52 (11) = happyGoto action_54
action_52 (12) = happyGoto action_7
action_52 (13) = happyGoto action_8
action_52 (14) = happyGoto action_9
action_52 (15) = happyGoto action_10
action_52 _ = happyFail

action_53 _ = happyReduce_6

action_54 (34) = happyShift action_35
action_54 (38) = happyShift action_36
action_54 (41) = happyShift action_38
action_54 (42) = happyShift action_39
action_54 (43) = happyShift action_40
action_54 (44) = happyShift action_41
action_54 (45) = happyShift action_42
action_54 (46) = happyShift action_43
action_54 (47) = happyShift action_44
action_54 (48) = happyShift action_45
action_54 (49) = happyShift action_46
action_54 (50) = happyShift action_47
action_54 (51) = happyShift action_48
action_54 (52) = happyShift action_49
action_54 (53) = happyShift action_50
action_54 _ = happyReduce_46

action_55 (34) = happyShift action_35
action_55 (38) = happyShift action_36
action_55 (41) = happyShift action_38
action_55 (42) = happyShift action_39
action_55 (43) = happyShift action_40
action_55 (44) = happyShift action_41
action_55 (45) = happyShift action_42
action_55 (46) = happyShift action_43
action_55 (47) = happyShift action_44
action_55 (48) = happyShift action_45
action_55 (49) = happyShift action_46
action_55 (50) = happyShift action_47
action_55 (51) = happyShift action_48
action_55 (52) = happyShift action_49
action_55 (53) = happyShift action_50
action_55 (55) = happyShift action_52
action_55 _ = happyReduce_45

action_56 (34) = happyShift action_35
action_56 (38) = happyShift action_36
action_56 (52) = happyShift action_49
action_56 (53) = happyShift action_50
action_56 _ = happyReduce_38

action_57 (34) = happyShift action_35
action_57 (38) = happyShift action_36
action_57 (52) = happyShift action_49
action_57 (53) = happyShift action_50
action_57 _ = happyReduce_37

action_58 (34) = happyShift action_35
action_58 (38) = happyShift action_36
action_58 (52) = happyShift action_49
action_58 (53) = happyShift action_50
action_58 _ = happyReduce_36

action_59 (34) = happyShift action_35
action_59 (38) = happyShift action_36
action_59 (49) = happyShift action_46
action_59 (50) = happyShift action_47
action_59 (51) = happyShift action_48
action_59 (52) = happyShift action_49
action_59 (53) = happyShift action_50
action_59 _ = happyReduce_35

action_60 (34) = happyShift action_35
action_60 (38) = happyShift action_36
action_60 (49) = happyShift action_46
action_60 (50) = happyShift action_47
action_60 (51) = happyShift action_48
action_60 (52) = happyShift action_49
action_60 (53) = happyShift action_50
action_60 _ = happyReduce_34

action_61 (34) = happyShift action_35
action_61 (38) = happyShift action_36
action_61 (43) = happyShift action_40
action_61 (44) = happyShift action_41
action_61 (47) = happyShift action_44
action_61 (48) = happyShift action_45
action_61 (49) = happyShift action_46
action_61 (50) = happyShift action_47
action_61 (51) = happyShift action_48
action_61 (52) = happyShift action_49
action_61 (53) = happyShift action_50
action_61 _ = happyReduce_44

action_62 (34) = happyShift action_35
action_62 (38) = happyShift action_36
action_62 (43) = happyShift action_40
action_62 (44) = happyShift action_41
action_62 (47) = happyShift action_44
action_62 (48) = happyShift action_45
action_62 (49) = happyShift action_46
action_62 (50) = happyShift action_47
action_62 (51) = happyShift action_48
action_62 (52) = happyShift action_49
action_62 (53) = happyShift action_50
action_62 _ = happyReduce_43

action_63 (34) = happyShift action_35
action_63 (38) = happyShift action_36
action_63 (47) = happyShift action_44
action_63 (48) = happyShift action_45
action_63 (49) = happyShift action_46
action_63 (50) = happyShift action_47
action_63 (51) = happyShift action_48
action_63 (52) = happyShift action_49
action_63 (53) = happyShift action_50
action_63 _ = happyReduce_42

action_64 (34) = happyShift action_35
action_64 (38) = happyShift action_36
action_64 (47) = happyShift action_44
action_64 (48) = happyShift action_45
action_64 (49) = happyShift action_46
action_64 (50) = happyShift action_47
action_64 (51) = happyShift action_48
action_64 (52) = happyShift action_49
action_64 (53) = happyShift action_50
action_64 _ = happyReduce_41

action_65 (34) = happyShift action_35
action_65 (38) = happyShift action_36
action_65 (43) = happyShift action_40
action_65 (44) = happyShift action_41
action_65 (45) = happyShift action_42
action_65 (46) = happyShift action_43
action_65 (47) = happyShift action_44
action_65 (48) = happyShift action_45
action_65 (49) = happyShift action_46
action_65 (50) = happyShift action_47
action_65 (51) = happyShift action_48
action_65 (52) = happyShift action_49
action_65 (53) = happyShift action_50
action_65 _ = happyReduce_40

action_66 (34) = happyShift action_35
action_66 (38) = happyShift action_36
action_66 (43) = happyShift action_40
action_66 (44) = happyShift action_41
action_66 (45) = happyShift action_42
action_66 (46) = happyShift action_43
action_66 (47) = happyShift action_44
action_66 (48) = happyShift action_45
action_66 (49) = happyShift action_46
action_66 (50) = happyShift action_47
action_66 (51) = happyShift action_48
action_66 (52) = happyShift action_49
action_66 (53) = happyShift action_50
action_66 _ = happyReduce_39

action_67 (34) = happyShift action_35
action_67 (38) = happyShift action_36
action_67 (40) = happyShift action_37
action_67 (41) = happyShift action_38
action_67 (42) = happyShift action_39
action_67 (43) = happyShift action_40
action_67 (44) = happyShift action_41
action_67 (45) = happyShift action_42
action_67 (46) = happyShift action_43
action_67 (47) = happyShift action_44
action_67 (48) = happyShift action_45
action_67 (49) = happyShift action_46
action_67 (50) = happyShift action_47
action_67 (51) = happyShift action_48
action_67 (52) = happyShift action_49
action_67 (53) = happyShift action_50
action_67 (54) = happyShift action_51
action_67 (55) = happyShift action_52
action_67 _ = happyReduce_31

action_68 (34) = happyShift action_35
action_68 (38) = happyShift action_36
action_68 (39) = happyShift action_91
action_68 (40) = happyShift action_37
action_68 (41) = happyShift action_38
action_68 (42) = happyShift action_39
action_68 (43) = happyShift action_40
action_68 (44) = happyShift action_41
action_68 (45) = happyShift action_42
action_68 (46) = happyShift action_43
action_68 (47) = happyShift action_44
action_68 (48) = happyShift action_45
action_68 (49) = happyShift action_46
action_68 (50) = happyShift action_47
action_68 (51) = happyShift action_48
action_68 (52) = happyShift action_49
action_68 (53) = happyShift action_50
action_68 (54) = happyShift action_51
action_68 (55) = happyShift action_52
action_68 _ = happyFail

action_69 (34) = happyShift action_35
action_69 (38) = happyShift action_36
action_69 (40) = happyShift action_37
action_69 (41) = happyShift action_38
action_69 (42) = happyShift action_39
action_69 (43) = happyShift action_40
action_69 (44) = happyShift action_41
action_69 (45) = happyShift action_42
action_69 (46) = happyShift action_43
action_69 (47) = happyShift action_44
action_69 (48) = happyShift action_45
action_69 (49) = happyShift action_46
action_69 (50) = happyShift action_47
action_69 (51) = happyShift action_48
action_69 (52) = happyShift action_49
action_69 (53) = happyShift action_50
action_69 (54) = happyShift action_51
action_69 (55) = happyShift action_52
action_69 _ = happyReduce_50

action_70 (35) = happyShift action_90
action_70 _ = happyFail

action_71 (33) = happyShift action_89
action_71 _ = happyReduce_49

action_72 (19) = happyShift action_88
action_72 _ = happyFail

action_73 (23) = happyShift action_87
action_73 _ = happyFail

action_74 (18) = happyShift action_11
action_74 (22) = happyShift action_12
action_74 (25) = happyShift action_13
action_74 (27) = happyShift action_14
action_74 (30) = happyShift action_15
action_74 (31) = happyShift action_16
action_74 (34) = happyShift action_17
action_74 (37) = happyShift action_86
action_74 (56) = happyShift action_18
action_74 (57) = happyShift action_19
action_74 (58) = happyShift action_20
action_74 (59) = happyShift action_21
action_74 (7) = happyGoto action_53
action_74 (9) = happyGoto action_4
action_74 (10) = happyGoto action_5
action_74 (11) = happyGoto action_6
action_74 (12) = happyGoto action_7
action_74 (13) = happyGoto action_8
action_74 (14) = happyGoto action_9
action_74 (15) = happyGoto action_10
action_74 _ = happyFail

action_75 (34) = happyShift action_17
action_75 (56) = happyShift action_18
action_75 (57) = happyShift action_19
action_75 (58) = happyShift action_20
action_75 (59) = happyShift action_21
action_75 (11) = happyGoto action_85
action_75 (12) = happyGoto action_7
action_75 (13) = happyGoto action_8
action_75 (14) = happyGoto action_9
action_75 (15) = happyGoto action_10
action_75 _ = happyFail

action_76 (34) = happyShift action_17
action_76 (56) = happyShift action_18
action_76 (57) = happyShift action_19
action_76 (58) = happyShift action_20
action_76 (59) = happyShift action_21
action_76 (11) = happyGoto action_84
action_76 (12) = happyGoto action_7
action_76 (13) = happyGoto action_8
action_76 (14) = happyGoto action_9
action_76 (15) = happyGoto action_10
action_76 _ = happyFail

action_77 (34) = happyShift action_17
action_77 (56) = happyShift action_18
action_77 (57) = happyShift action_19
action_77 (58) = happyShift action_20
action_77 (59) = happyShift action_21
action_77 (11) = happyGoto action_83
action_77 (12) = happyGoto action_7
action_77 (13) = happyGoto action_8
action_77 (14) = happyGoto action_9
action_77 (15) = happyGoto action_10
action_77 _ = happyFail

action_78 (58) = happyShift action_82
action_78 (8) = happyGoto action_81
action_78 _ = happyReduce_12

action_79 _ = happyReduce_9

action_80 _ = happyReduce_25

action_81 (33) = happyShift action_98
action_81 (35) = happyShift action_99
action_81 _ = happyFail

action_82 _ = happyReduce_13

action_83 (32) = happyShift action_97
action_83 (34) = happyShift action_35
action_83 (38) = happyShift action_36
action_83 (40) = happyShift action_37
action_83 (41) = happyShift action_38
action_83 (42) = happyShift action_39
action_83 (43) = happyShift action_40
action_83 (44) = happyShift action_41
action_83 (45) = happyShift action_42
action_83 (46) = happyShift action_43
action_83 (47) = happyShift action_44
action_83 (48) = happyShift action_45
action_83 (49) = happyShift action_46
action_83 (50) = happyShift action_47
action_83 (51) = happyShift action_48
action_83 (52) = happyShift action_49
action_83 (53) = happyShift action_50
action_83 (54) = happyShift action_51
action_83 (55) = happyShift action_52
action_83 _ = happyFail

action_84 (32) = happyShift action_96
action_84 (34) = happyShift action_35
action_84 (38) = happyShift action_36
action_84 (40) = happyShift action_37
action_84 (41) = happyShift action_38
action_84 (42) = happyShift action_39
action_84 (43) = happyShift action_40
action_84 (44) = happyShift action_41
action_84 (45) = happyShift action_42
action_84 (46) = happyShift action_43
action_84 (47) = happyShift action_44
action_84 (48) = happyShift action_45
action_84 (49) = happyShift action_46
action_84 (50) = happyShift action_47
action_84 (51) = happyShift action_48
action_84 (52) = happyShift action_49
action_84 (53) = happyShift action_50
action_84 (54) = happyShift action_51
action_84 (55) = happyShift action_52
action_84 _ = happyFail

action_85 (32) = happyShift action_95
action_85 (34) = happyShift action_35
action_85 (38) = happyShift action_36
action_85 (40) = happyShift action_37
action_85 (41) = happyShift action_38
action_85 (42) = happyShift action_39
action_85 (43) = happyShift action_40
action_85 (44) = happyShift action_41
action_85 (45) = happyShift action_42
action_85 (46) = happyShift action_43
action_85 (47) = happyShift action_44
action_85 (48) = happyShift action_45
action_85 (49) = happyShift action_46
action_85 (50) = happyShift action_47
action_85 (51) = happyShift action_48
action_85 (52) = happyShift action_49
action_85 (53) = happyShift action_50
action_85 (54) = happyShift action_51
action_85 (55) = happyShift action_52
action_85 _ = happyFail

action_86 _ = happyReduce_4

action_87 (18) = happyShift action_11
action_87 (22) = happyShift action_12
action_87 (25) = happyShift action_13
action_87 (27) = happyShift action_14
action_87 (30) = happyShift action_15
action_87 (31) = happyShift action_16
action_87 (34) = happyShift action_17
action_87 (36) = happyShift action_31
action_87 (56) = happyShift action_18
action_87 (57) = happyShift action_19
action_87 (58) = happyShift action_20
action_87 (59) = happyShift action_21
action_87 (5) = happyGoto action_94
action_87 (7) = happyGoto action_30
action_87 (9) = happyGoto action_4
action_87 (10) = happyGoto action_5
action_87 (11) = happyGoto action_6
action_87 (12) = happyGoto action_7
action_87 (13) = happyGoto action_8
action_87 (14) = happyGoto action_9
action_87 (15) = happyGoto action_10
action_87 _ = happyReduce_2

action_88 (18) = happyShift action_11
action_88 (22) = happyShift action_12
action_88 (25) = happyShift action_13
action_88 (27) = happyShift action_14
action_88 (30) = happyShift action_15
action_88 (31) = happyShift action_16
action_88 (34) = happyShift action_17
action_88 (36) = happyShift action_31
action_88 (56) = happyShift action_18
action_88 (57) = happyShift action_19
action_88 (58) = happyShift action_20
action_88 (59) = happyShift action_21
action_88 (5) = happyGoto action_93
action_88 (7) = happyGoto action_30
action_88 (9) = happyGoto action_4
action_88 (10) = happyGoto action_5
action_88 (11) = happyGoto action_6
action_88 (12) = happyGoto action_7
action_88 (13) = happyGoto action_8
action_88 (14) = happyGoto action_9
action_88 (15) = happyGoto action_10
action_88 _ = happyReduce_2

action_89 (34) = happyShift action_17
action_89 (56) = happyShift action_18
action_89 (57) = happyShift action_19
action_89 (58) = happyShift action_20
action_89 (59) = happyShift action_21
action_89 (11) = happyGoto action_92
action_89 (12) = happyGoto action_7
action_89 (13) = happyGoto action_8
action_89 (14) = happyGoto action_9
action_89 (15) = happyGoto action_10
action_89 _ = happyFail

action_90 _ = happyReduce_22

action_91 _ = happyReduce_23

action_92 (34) = happyShift action_35
action_92 (38) = happyShift action_36
action_92 (40) = happyShift action_37
action_92 (41) = happyShift action_38
action_92 (42) = happyShift action_39
action_92 (43) = happyShift action_40
action_92 (44) = happyShift action_41
action_92 (45) = happyShift action_42
action_92 (46) = happyShift action_43
action_92 (47) = happyShift action_44
action_92 (48) = happyShift action_45
action_92 (49) = happyShift action_46
action_92 (50) = happyShift action_47
action_92 (51) = happyShift action_48
action_92 (52) = happyShift action_49
action_92 (53) = happyShift action_50
action_92 (54) = happyShift action_51
action_92 (55) = happyShift action_52
action_92 _ = happyReduce_51

action_93 (20) = happyShift action_105
action_93 (21) = happyShift action_106
action_93 _ = happyFail

action_94 (24) = happyShift action_104
action_94 _ = happyFail

action_95 _ = happyReduce_18

action_96 (23) = happyShift action_103
action_96 _ = happyFail

action_97 (23) = happyShift action_102
action_97 _ = happyFail

action_98 (58) = happyShift action_101
action_98 _ = happyFail

action_99 (18) = happyShift action_11
action_99 (22) = happyShift action_12
action_99 (25) = happyShift action_13
action_99 (27) = happyShift action_14
action_99 (30) = happyShift action_15
action_99 (31) = happyShift action_16
action_99 (34) = happyShift action_17
action_99 (36) = happyShift action_31
action_99 (56) = happyShift action_18
action_99 (57) = happyShift action_19
action_99 (58) = happyShift action_20
action_99 (59) = happyShift action_21
action_99 (5) = happyGoto action_100
action_99 (7) = happyGoto action_30
action_99 (9) = happyGoto action_4
action_99 (10) = happyGoto action_5
action_99 (11) = happyGoto action_6
action_99 (12) = happyGoto action_7
action_99 (13) = happyGoto action_8
action_99 (14) = happyGoto action_9
action_99 (15) = happyGoto action_10
action_99 _ = happyReduce_2

action_100 _ = happyReduce_10

action_101 _ = happyReduce_14

action_102 (18) = happyShift action_11
action_102 (22) = happyShift action_12
action_102 (25) = happyShift action_13
action_102 (27) = happyShift action_14
action_102 (30) = happyShift action_15
action_102 (31) = happyShift action_16
action_102 (34) = happyShift action_17
action_102 (36) = happyShift action_31
action_102 (56) = happyShift action_18
action_102 (57) = happyShift action_19
action_102 (58) = happyShift action_20
action_102 (59) = happyShift action_21
action_102 (5) = happyGoto action_109
action_102 (7) = happyGoto action_30
action_102 (9) = happyGoto action_4
action_102 (10) = happyGoto action_5
action_102 (11) = happyGoto action_6
action_102 (12) = happyGoto action_7
action_102 (13) = happyGoto action_8
action_102 (14) = happyGoto action_9
action_102 (15) = happyGoto action_10
action_102 _ = happyReduce_2

action_103 (18) = happyShift action_11
action_103 (22) = happyShift action_12
action_103 (25) = happyShift action_13
action_103 (27) = happyShift action_14
action_103 (30) = happyShift action_15
action_103 (31) = happyShift action_16
action_103 (34) = happyShift action_17
action_103 (36) = happyShift action_31
action_103 (56) = happyShift action_18
action_103 (57) = happyShift action_19
action_103 (58) = happyShift action_20
action_103 (59) = happyShift action_21
action_103 (5) = happyGoto action_108
action_103 (7) = happyGoto action_30
action_103 (9) = happyGoto action_4
action_103 (10) = happyGoto action_5
action_103 (11) = happyGoto action_6
action_103 (12) = happyGoto action_7
action_103 (13) = happyGoto action_8
action_103 (14) = happyGoto action_9
action_103 (15) = happyGoto action_10
action_103 _ = happyReduce_2

action_104 _ = happyReduce_17

action_105 (18) = happyShift action_11
action_105 (22) = happyShift action_12
action_105 (25) = happyShift action_13
action_105 (27) = happyShift action_14
action_105 (30) = happyShift action_15
action_105 (31) = happyShift action_16
action_105 (34) = happyShift action_17
action_105 (36) = happyShift action_31
action_105 (56) = happyShift action_18
action_105 (57) = happyShift action_19
action_105 (58) = happyShift action_20
action_105 (59) = happyShift action_21
action_105 (5) = happyGoto action_107
action_105 (7) = happyGoto action_30
action_105 (9) = happyGoto action_4
action_105 (10) = happyGoto action_5
action_105 (11) = happyGoto action_6
action_105 (12) = happyGoto action_7
action_105 (13) = happyGoto action_8
action_105 (14) = happyGoto action_9
action_105 (15) = happyGoto action_10
action_105 _ = happyReduce_2

action_106 _ = happyReduce_16

action_107 (21) = happyShift action_112
action_107 _ = happyFail

action_108 (24) = happyShift action_111
action_108 _ = happyFail

action_109 (24) = happyShift action_110
action_109 _ = happyFail

action_110 _ = happyReduce_20

action_111 _ = happyReduce_19

action_112 _ = happyReduce_15

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_0  5 happyReduction_2
happyReduction_2  =  HappyAbsSyn5
		 ([]
	)

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1:[]
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_3  5 happyReduction_4
happyReduction_4 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1:[]
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  6 happyReduction_6
happyReduction_6 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 ++ happy_var_2:[]
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  7 happyReduction_7
happyReduction_7 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  7 happyReduction_8
happyReduction_8 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  7 happyReduction_9
happyReduction_9 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (StatementReturn happy_var_2
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happyReduce 6 7 happyReduction_10
happyReduction_10 ((HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (StatementFunctionDeclaration happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_2  7 happyReduction_11
happyReduction_11 _
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn7
		 (StatementExpression happy_var_1
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_0  8 happyReduction_12
happyReduction_12  =  HappyAbsSyn8
		 ([]
	)

happyReduce_13 = happySpecReduce_1  8 happyReduction_13
happyReduction_13 (HappyTerminal (TokenWord happy_var_1))
	 =  HappyAbsSyn8
		 (happy_var_1:[]
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  8 happyReduction_14
happyReduction_14 (HappyTerminal (TokenWord happy_var_3))
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 ++ happy_var_3:[]
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happyReduce 8 9 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (StatementIf happy_var_2 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 6 9 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (StatementIf happy_var_2 happy_var_5 []
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 6 10 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (StatementWhile happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 5 10 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (StatementRepeat happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 8 10 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (StatementForTo happy_var_2 happy_var_4 happy_var_7
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 8 10 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (StatementForDownto happy_var_2 happy_var_4 happy_var_7
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_1  11 happyReduction_21
happyReduction_21 (HappyTerminal (TokenStringLit happy_var_1))
	 =  HappyAbsSyn11
		 (ExpressionConstant (ConstantString happy_var_1)
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happyReduce 4 11 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (ExpressionFunctionCall happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 4 11 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (ExpressionArrayAccess happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_24 = happySpecReduce_1  11 happyReduction_24
happyReduction_24 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn11
		 (ExpressionConstant (ConstantInt happy_var_1)
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  11 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  11 happyReduction_26
happyReduction_26 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  11 happyReduction_27
happyReduction_27 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  11 happyReduction_28
happyReduction_28 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  11 happyReduction_29
happyReduction_29 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  11 happyReduction_30
happyReduction_30 (HappyTerminal (TokenWord happy_var_1))
	 =  HappyAbsSyn11
		 (ExpressionVar happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  12 happyReduction_31
happyReduction_31 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionAssign happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_2  13 happyReduction_32
happyReduction_32 _
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionArithInc happy_var_1
	)
happyReduction_32 _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_2  13 happyReduction_33
happyReduction_33 _
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionArithDec happy_var_1
	)
happyReduction_33 _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  13 happyReduction_34
happyReduction_34 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionArithPlus happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  13 happyReduction_35
happyReduction_35 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionArithMinus happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  13 happyReduction_36
happyReduction_36 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionArithMul happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  13 happyReduction_37
happyReduction_37 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionArithDiv happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  13 happyReduction_38
happyReduction_38 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionArithMod happy_var_1 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  14 happyReduction_39
happyReduction_39 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionCompareEq happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  14 happyReduction_40
happyReduction_40 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionCompareNeq happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  14 happyReduction_41
happyReduction_41 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionCompareLt  happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  14 happyReduction_42
happyReduction_42 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionCompareLeq happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  14 happyReduction_43
happyReduction_43 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionCompareGt happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  14 happyReduction_44
happyReduction_44 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionCompareGeq happy_var_1 happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  15 happyReduction_45
happyReduction_45 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionLogicAnd happy_var_1 happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  15 happyReduction_46
happyReduction_46 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionLogicOr happy_var_1 happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_2  15 happyReduction_47
happyReduction_47 (HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (ExpressionLogicNot happy_var_2
	)
happyReduction_47 _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_0  16 happyReduction_48
happyReduction_48  =  HappyAbsSyn16
		 ([]
	)

happyReduce_49 = happySpecReduce_1  16 happyReduction_49
happyReduction_49 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_1  17 happyReduction_50
happyReduction_50 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1 : []
	)
happyReduction_50 _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  17 happyReduction_51
happyReduction_51 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_3 : happy_var_1
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 60 60 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenIf -> cont 18;
	TokenThen -> cont 19;
	TokenElse -> cont 20;
	TokenFi -> cont 21;
	TokenWhile -> cont 22;
	TokenDo -> cont 23;
	TokenOd -> cont 24;
	TokenRepeat -> cont 25;
	TokenUntil -> cont 26;
	TokenFor -> cont 27;
	TokenTo -> cont 28;
	TokenDownto -> cont 29;
	TokenFunction -> cont 30;
	TokenReturn -> cont 31;
	TokenSemicolon -> cont 32;
	TokenComma -> cont 33;
	TokenRBOpen -> cont 34;
	TokenRBClose -> cont 35;
	TokenCBOpen -> cont 36;
	TokenCBClose -> cont 37;
	TokenSBOpen -> cont 38;
	TokenSBClose -> cont 39;
	TokenLeftarrow -> cont 40;
	TokenCompEq -> cont 41;
	TokenCompNeq -> cont 42;
	TokenCompLt -> cont 43;
	TokenCompLeq -> cont 44;
	TokenCompGt -> cont 45;
	TokenCompGeq -> cont 46;
	TokenArithPlus -> cont 47;
	TokenArithMinus -> cont 48;
	TokenArithMul -> cont 49;
	TokenArithDiv -> cont 50;
	TokenArithMod -> cont 51;
	TokenArithInc -> cont 52;
	TokenArithDec -> cont 53;
	TokenLogicAnd -> cont 54;
	TokenLogicOr -> cont 55;
	TokenLogicNot -> cont 56;
	TokenInt happy_dollar_dollar -> cont 57;
	TokenWord happy_dollar_dollar -> cont 58;
	TokenStringLit happy_dollar_dollar -> cont 59;
	_ -> happyError' (tk:tks)
	}

happyError_ 60 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = return
    (<*>) = ap
instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [(Token)] -> HappyIdentity a
happyError' = HappyIdentity . parseError

parsePSC tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError a = error $ "parse Error: "++ show a
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc-8.0.1/include/ghcversion.h" #-}

















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc640_0/ghc_2.h" #-}


































































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 13 "templates/GenericTemplate.hs" #-}

{-# LINE 46 "templates/GenericTemplate.hs" #-}








{-# LINE 67 "templates/GenericTemplate.hs" #-}

{-# LINE 77 "templates/GenericTemplate.hs" #-}

{-# LINE 86 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 155 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 256 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 322 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
