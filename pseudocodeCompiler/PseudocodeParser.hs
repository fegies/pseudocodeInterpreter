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
	| HappyAbsSyn15 ([Expression])

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
 action_96 :: () => Int -> ({-HappyReduction (HappyIdentity) = -}
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
 happyReduce_48 :: () => ({-HappyReduction (HappyIdentity) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (HappyIdentity) HappyAbsSyn)

action_0 (17) = happyShift action_10
action_0 (21) = happyShift action_11
action_0 (24) = happyShift action_12
action_0 (26) = happyShift action_13
action_0 (27) = happyShift action_14
action_0 (30) = happyShift action_15
action_0 (52) = happyShift action_16
action_0 (53) = happyShift action_17
action_0 (54) = happyShift action_18
action_0 (55) = happyShift action_19
action_0 (4) = happyGoto action_20
action_0 (6) = happyGoto action_2
action_0 (7) = happyGoto action_3
action_0 (9) = happyGoto action_4
action_0 (10) = happyGoto action_5
action_0 (11) = happyGoto action_6
action_0 (12) = happyGoto action_7
action_0 (13) = happyGoto action_8
action_0 (14) = happyGoto action_9
action_0 _ = happyFail

action_1 (17) = happyShift action_10
action_1 (21) = happyShift action_11
action_1 (24) = happyShift action_12
action_1 (26) = happyShift action_13
action_1 (27) = happyShift action_14
action_1 (30) = happyShift action_15
action_1 (52) = happyShift action_16
action_1 (53) = happyShift action_17
action_1 (54) = happyShift action_18
action_1 (55) = happyShift action_19
action_1 (6) = happyGoto action_2
action_1 (7) = happyGoto action_3
action_1 (9) = happyGoto action_4
action_1 (10) = happyGoto action_5
action_1 (11) = happyGoto action_6
action_1 (12) = happyGoto action_7
action_1 (13) = happyGoto action_8
action_1 (14) = happyGoto action_9
action_1 _ = happyFail

action_2 (17) = happyShift action_10
action_2 (21) = happyShift action_11
action_2 (24) = happyShift action_12
action_2 (26) = happyShift action_13
action_2 (27) = happyShift action_14
action_2 (30) = happyShift action_15
action_2 (52) = happyShift action_16
action_2 (53) = happyShift action_17
action_2 (54) = happyShift action_18
action_2 (55) = happyShift action_19
action_2 (7) = happyGoto action_49
action_2 (9) = happyGoto action_4
action_2 (10) = happyGoto action_5
action_2 (11) = happyGoto action_6
action_2 (12) = happyGoto action_7
action_2 (13) = happyGoto action_8
action_2 (14) = happyGoto action_9
action_2 _ = happyReduce_1

action_3 _ = happyReduce_5

action_4 _ = happyReduce_7

action_5 _ = happyReduce_8

action_6 (28) = happyShift action_30
action_6 (30) = happyShift action_31
action_6 (34) = happyShift action_32
action_6 (36) = happyShift action_33
action_6 (37) = happyShift action_34
action_6 (38) = happyShift action_35
action_6 (39) = happyShift action_36
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
action_6 _ = happyFail

action_7 _ = happyReduce_24

action_8 _ = happyReduce_26

action_9 _ = happyReduce_25

action_10 (30) = happyShift action_15
action_10 (52) = happyShift action_16
action_10 (53) = happyShift action_17
action_10 (54) = happyShift action_18
action_10 (55) = happyShift action_19
action_10 (11) = happyGoto action_29
action_10 (12) = happyGoto action_7
action_10 (13) = happyGoto action_8
action_10 (14) = happyGoto action_9
action_10 _ = happyFail

action_11 (30) = happyShift action_15
action_11 (52) = happyShift action_16
action_11 (53) = happyShift action_17
action_11 (54) = happyShift action_18
action_11 (55) = happyShift action_19
action_11 (11) = happyGoto action_28
action_11 (12) = happyGoto action_7
action_11 (13) = happyGoto action_8
action_11 (14) = happyGoto action_9
action_11 _ = happyFail

action_12 (17) = happyShift action_10
action_12 (21) = happyShift action_11
action_12 (24) = happyShift action_12
action_12 (26) = happyShift action_13
action_12 (27) = happyShift action_14
action_12 (30) = happyShift action_15
action_12 (32) = happyShift action_27
action_12 (52) = happyShift action_16
action_12 (53) = happyShift action_17
action_12 (54) = happyShift action_18
action_12 (55) = happyShift action_19
action_12 (5) = happyGoto action_25
action_12 (7) = happyGoto action_26
action_12 (9) = happyGoto action_4
action_12 (10) = happyGoto action_5
action_12 (11) = happyGoto action_6
action_12 (12) = happyGoto action_7
action_12 (13) = happyGoto action_8
action_12 (14) = happyGoto action_9
action_12 _ = happyReduce_2

action_13 (54) = happyShift action_24
action_13 _ = happyFail

action_14 (30) = happyShift action_15
action_14 (52) = happyShift action_16
action_14 (53) = happyShift action_17
action_14 (54) = happyShift action_18
action_14 (55) = happyShift action_19
action_14 (11) = happyGoto action_23
action_14 (12) = happyGoto action_7
action_14 (13) = happyGoto action_8
action_14 (14) = happyGoto action_9
action_14 _ = happyFail

action_15 (30) = happyShift action_15
action_15 (52) = happyShift action_16
action_15 (53) = happyShift action_17
action_15 (54) = happyShift action_18
action_15 (55) = happyShift action_19
action_15 (11) = happyGoto action_22
action_15 (12) = happyGoto action_7
action_15 (13) = happyGoto action_8
action_15 (14) = happyGoto action_9
action_15 _ = happyFail

action_16 (30) = happyShift action_15
action_16 (52) = happyShift action_16
action_16 (53) = happyShift action_17
action_16 (54) = happyShift action_18
action_16 (55) = happyShift action_19
action_16 (11) = happyGoto action_21
action_16 (12) = happyGoto action_7
action_16 (13) = happyGoto action_8
action_16 (14) = happyGoto action_9
action_16 _ = happyFail

action_17 _ = happyReduce_22

action_18 _ = happyReduce_28

action_19 _ = happyReduce_19

action_20 (56) = happyAccept
action_20 _ = happyFail

action_21 (30) = happyShift action_31
action_21 (34) = happyShift action_32
action_21 (48) = happyShift action_45
action_21 (49) = happyShift action_46
action_21 _ = happyReduce_44

action_22 (30) = happyShift action_31
action_22 (31) = happyShift action_74
action_22 (34) = happyShift action_32
action_22 (36) = happyShift action_33
action_22 (37) = happyShift action_34
action_22 (38) = happyShift action_35
action_22 (39) = happyShift action_36
action_22 (40) = happyShift action_37
action_22 (41) = happyShift action_38
action_22 (42) = happyShift action_39
action_22 (43) = happyShift action_40
action_22 (44) = happyShift action_41
action_22 (45) = happyShift action_42
action_22 (46) = happyShift action_43
action_22 (47) = happyShift action_44
action_22 (48) = happyShift action_45
action_22 (49) = happyShift action_46
action_22 (50) = happyShift action_47
action_22 (51) = happyShift action_48
action_22 _ = happyFail

action_23 (28) = happyShift action_73
action_23 (30) = happyShift action_31
action_23 (34) = happyShift action_32
action_23 (36) = happyShift action_33
action_23 (37) = happyShift action_34
action_23 (38) = happyShift action_35
action_23 (39) = happyShift action_36
action_23 (40) = happyShift action_37
action_23 (41) = happyShift action_38
action_23 (42) = happyShift action_39
action_23 (43) = happyShift action_40
action_23 (44) = happyShift action_41
action_23 (45) = happyShift action_42
action_23 (46) = happyShift action_43
action_23 (47) = happyShift action_44
action_23 (48) = happyShift action_45
action_23 (49) = happyShift action_46
action_23 (50) = happyShift action_47
action_23 (51) = happyShift action_48
action_23 _ = happyFail

action_24 (30) = happyShift action_72
action_24 _ = happyFail

action_25 (25) = happyShift action_71
action_25 _ = happyFail

action_26 _ = happyReduce_3

action_27 (17) = happyShift action_10
action_27 (21) = happyShift action_11
action_27 (24) = happyShift action_12
action_27 (26) = happyShift action_13
action_27 (27) = happyShift action_14
action_27 (30) = happyShift action_15
action_27 (52) = happyShift action_16
action_27 (53) = happyShift action_17
action_27 (54) = happyShift action_18
action_27 (55) = happyShift action_19
action_27 (6) = happyGoto action_70
action_27 (7) = happyGoto action_3
action_27 (9) = happyGoto action_4
action_27 (10) = happyGoto action_5
action_27 (11) = happyGoto action_6
action_27 (12) = happyGoto action_7
action_27 (13) = happyGoto action_8
action_27 (14) = happyGoto action_9
action_27 _ = happyFail

action_28 (28) = happyShift action_69
action_28 (30) = happyShift action_31
action_28 (34) = happyShift action_32
action_28 (36) = happyShift action_33
action_28 (37) = happyShift action_34
action_28 (38) = happyShift action_35
action_28 (39) = happyShift action_36
action_28 (40) = happyShift action_37
action_28 (41) = happyShift action_38
action_28 (42) = happyShift action_39
action_28 (43) = happyShift action_40
action_28 (44) = happyShift action_41
action_28 (45) = happyShift action_42
action_28 (46) = happyShift action_43
action_28 (47) = happyShift action_44
action_28 (48) = happyShift action_45
action_28 (49) = happyShift action_46
action_28 (50) = happyShift action_47
action_28 (51) = happyShift action_48
action_28 _ = happyFail

action_29 (28) = happyShift action_68
action_29 (30) = happyShift action_31
action_29 (34) = happyShift action_32
action_29 (36) = happyShift action_33
action_29 (37) = happyShift action_34
action_29 (38) = happyShift action_35
action_29 (39) = happyShift action_36
action_29 (40) = happyShift action_37
action_29 (41) = happyShift action_38
action_29 (42) = happyShift action_39
action_29 (43) = happyShift action_40
action_29 (44) = happyShift action_41
action_29 (45) = happyShift action_42
action_29 (46) = happyShift action_43
action_29 (47) = happyShift action_44
action_29 (48) = happyShift action_45
action_29 (49) = happyShift action_46
action_29 (50) = happyShift action_47
action_29 (51) = happyShift action_48
action_29 _ = happyFail

action_30 _ = happyReduce_11

action_31 (30) = happyShift action_15
action_31 (52) = happyShift action_16
action_31 (53) = happyShift action_17
action_31 (54) = happyShift action_18
action_31 (55) = happyShift action_19
action_31 (11) = happyGoto action_65
action_31 (12) = happyGoto action_7
action_31 (13) = happyGoto action_8
action_31 (14) = happyGoto action_9
action_31 (15) = happyGoto action_66
action_31 (16) = happyGoto action_67
action_31 _ = happyReduce_45

action_32 (30) = happyShift action_15
action_32 (52) = happyShift action_16
action_32 (53) = happyShift action_17
action_32 (54) = happyShift action_18
action_32 (55) = happyShift action_19
action_32 (11) = happyGoto action_64
action_32 (12) = happyGoto action_7
action_32 (13) = happyGoto action_8
action_32 (14) = happyGoto action_9
action_32 _ = happyFail

action_33 (30) = happyShift action_15
action_33 (52) = happyShift action_16
action_33 (53) = happyShift action_17
action_33 (54) = happyShift action_18
action_33 (55) = happyShift action_19
action_33 (11) = happyGoto action_63
action_33 (12) = happyGoto action_7
action_33 (13) = happyGoto action_8
action_33 (14) = happyGoto action_9
action_33 _ = happyFail

action_34 (30) = happyShift action_15
action_34 (52) = happyShift action_16
action_34 (53) = happyShift action_17
action_34 (54) = happyShift action_18
action_34 (55) = happyShift action_19
action_34 (11) = happyGoto action_62
action_34 (12) = happyGoto action_7
action_34 (13) = happyGoto action_8
action_34 (14) = happyGoto action_9
action_34 _ = happyFail

action_35 (30) = happyShift action_15
action_35 (52) = happyShift action_16
action_35 (53) = happyShift action_17
action_35 (54) = happyShift action_18
action_35 (55) = happyShift action_19
action_35 (11) = happyGoto action_61
action_35 (12) = happyGoto action_7
action_35 (13) = happyGoto action_8
action_35 (14) = happyGoto action_9
action_35 _ = happyFail

action_36 (30) = happyShift action_15
action_36 (52) = happyShift action_16
action_36 (53) = happyShift action_17
action_36 (54) = happyShift action_18
action_36 (55) = happyShift action_19
action_36 (11) = happyGoto action_60
action_36 (12) = happyGoto action_7
action_36 (13) = happyGoto action_8
action_36 (14) = happyGoto action_9
action_36 _ = happyFail

action_37 (30) = happyShift action_15
action_37 (52) = happyShift action_16
action_37 (53) = happyShift action_17
action_37 (54) = happyShift action_18
action_37 (55) = happyShift action_19
action_37 (11) = happyGoto action_59
action_37 (12) = happyGoto action_7
action_37 (13) = happyGoto action_8
action_37 (14) = happyGoto action_9
action_37 _ = happyFail

action_38 (30) = happyShift action_15
action_38 (52) = happyShift action_16
action_38 (53) = happyShift action_17
action_38 (54) = happyShift action_18
action_38 (55) = happyShift action_19
action_38 (11) = happyGoto action_58
action_38 (12) = happyGoto action_7
action_38 (13) = happyGoto action_8
action_38 (14) = happyGoto action_9
action_38 _ = happyFail

action_39 (30) = happyShift action_15
action_39 (52) = happyShift action_16
action_39 (53) = happyShift action_17
action_39 (54) = happyShift action_18
action_39 (55) = happyShift action_19
action_39 (11) = happyGoto action_57
action_39 (12) = happyGoto action_7
action_39 (13) = happyGoto action_8
action_39 (14) = happyGoto action_9
action_39 _ = happyFail

action_40 (30) = happyShift action_15
action_40 (52) = happyShift action_16
action_40 (53) = happyShift action_17
action_40 (54) = happyShift action_18
action_40 (55) = happyShift action_19
action_40 (11) = happyGoto action_56
action_40 (12) = happyGoto action_7
action_40 (13) = happyGoto action_8
action_40 (14) = happyGoto action_9
action_40 _ = happyFail

action_41 (30) = happyShift action_15
action_41 (52) = happyShift action_16
action_41 (53) = happyShift action_17
action_41 (54) = happyShift action_18
action_41 (55) = happyShift action_19
action_41 (11) = happyGoto action_55
action_41 (12) = happyGoto action_7
action_41 (13) = happyGoto action_8
action_41 (14) = happyGoto action_9
action_41 _ = happyFail

action_42 (30) = happyShift action_15
action_42 (52) = happyShift action_16
action_42 (53) = happyShift action_17
action_42 (54) = happyShift action_18
action_42 (55) = happyShift action_19
action_42 (11) = happyGoto action_54
action_42 (12) = happyGoto action_7
action_42 (13) = happyGoto action_8
action_42 (14) = happyGoto action_9
action_42 _ = happyFail

action_43 (30) = happyShift action_15
action_43 (52) = happyShift action_16
action_43 (53) = happyShift action_17
action_43 (54) = happyShift action_18
action_43 (55) = happyShift action_19
action_43 (11) = happyGoto action_53
action_43 (12) = happyGoto action_7
action_43 (13) = happyGoto action_8
action_43 (14) = happyGoto action_9
action_43 _ = happyFail

action_44 (30) = happyShift action_15
action_44 (52) = happyShift action_16
action_44 (53) = happyShift action_17
action_44 (54) = happyShift action_18
action_44 (55) = happyShift action_19
action_44 (11) = happyGoto action_52
action_44 (12) = happyGoto action_7
action_44 (13) = happyGoto action_8
action_44 (14) = happyGoto action_9
action_44 _ = happyFail

action_45 _ = happyReduce_29

action_46 _ = happyReduce_30

action_47 (30) = happyShift action_15
action_47 (52) = happyShift action_16
action_47 (53) = happyShift action_17
action_47 (54) = happyShift action_18
action_47 (55) = happyShift action_19
action_47 (11) = happyGoto action_51
action_47 (12) = happyGoto action_7
action_47 (13) = happyGoto action_8
action_47 (14) = happyGoto action_9
action_47 _ = happyFail

action_48 (30) = happyShift action_15
action_48 (52) = happyShift action_16
action_48 (53) = happyShift action_17
action_48 (54) = happyShift action_18
action_48 (55) = happyShift action_19
action_48 (11) = happyGoto action_50
action_48 (12) = happyGoto action_7
action_48 (13) = happyGoto action_8
action_48 (14) = happyGoto action_9
action_48 _ = happyFail

action_49 _ = happyReduce_6

action_50 (30) = happyShift action_31
action_50 (34) = happyShift action_32
action_50 (37) = happyShift action_34
action_50 (38) = happyShift action_35
action_50 (39) = happyShift action_36
action_50 (40) = happyShift action_37
action_50 (41) = happyShift action_38
action_50 (42) = happyShift action_39
action_50 (43) = happyShift action_40
action_50 (44) = happyShift action_41
action_50 (45) = happyShift action_42
action_50 (46) = happyShift action_43
action_50 (47) = happyShift action_44
action_50 (48) = happyShift action_45
action_50 (49) = happyShift action_46
action_50 _ = happyReduce_43

action_51 (30) = happyShift action_31
action_51 (34) = happyShift action_32
action_51 (37) = happyShift action_34
action_51 (38) = happyShift action_35
action_51 (39) = happyShift action_36
action_51 (40) = happyShift action_37
action_51 (41) = happyShift action_38
action_51 (42) = happyShift action_39
action_51 (43) = happyShift action_40
action_51 (44) = happyShift action_41
action_51 (45) = happyShift action_42
action_51 (46) = happyShift action_43
action_51 (47) = happyShift action_44
action_51 (48) = happyShift action_45
action_51 (49) = happyShift action_46
action_51 (51) = happyShift action_48
action_51 _ = happyReduce_42

action_52 (30) = happyShift action_31
action_52 (34) = happyShift action_32
action_52 (48) = happyShift action_45
action_52 (49) = happyShift action_46
action_52 _ = happyReduce_35

action_53 (30) = happyShift action_31
action_53 (34) = happyShift action_32
action_53 (48) = happyShift action_45
action_53 (49) = happyShift action_46
action_53 _ = happyReduce_34

action_54 (30) = happyShift action_31
action_54 (34) = happyShift action_32
action_54 (48) = happyShift action_45
action_54 (49) = happyShift action_46
action_54 _ = happyReduce_33

action_55 (30) = happyShift action_31
action_55 (34) = happyShift action_32
action_55 (45) = happyShift action_42
action_55 (46) = happyShift action_43
action_55 (47) = happyShift action_44
action_55 (48) = happyShift action_45
action_55 (49) = happyShift action_46
action_55 _ = happyReduce_32

action_56 (30) = happyShift action_31
action_56 (34) = happyShift action_32
action_56 (45) = happyShift action_42
action_56 (46) = happyShift action_43
action_56 (47) = happyShift action_44
action_56 (48) = happyShift action_45
action_56 (49) = happyShift action_46
action_56 _ = happyReduce_31

action_57 (30) = happyShift action_31
action_57 (34) = happyShift action_32
action_57 (39) = happyShift action_36
action_57 (40) = happyShift action_37
action_57 (43) = happyShift action_40
action_57 (44) = happyShift action_41
action_57 (45) = happyShift action_42
action_57 (46) = happyShift action_43
action_57 (47) = happyShift action_44
action_57 (48) = happyShift action_45
action_57 (49) = happyShift action_46
action_57 _ = happyReduce_41

action_58 (30) = happyShift action_31
action_58 (34) = happyShift action_32
action_58 (39) = happyShift action_36
action_58 (40) = happyShift action_37
action_58 (43) = happyShift action_40
action_58 (44) = happyShift action_41
action_58 (45) = happyShift action_42
action_58 (46) = happyShift action_43
action_58 (47) = happyShift action_44
action_58 (48) = happyShift action_45
action_58 (49) = happyShift action_46
action_58 _ = happyReduce_40

action_59 (30) = happyShift action_31
action_59 (34) = happyShift action_32
action_59 (43) = happyShift action_40
action_59 (44) = happyShift action_41
action_59 (45) = happyShift action_42
action_59 (46) = happyShift action_43
action_59 (47) = happyShift action_44
action_59 (48) = happyShift action_45
action_59 (49) = happyShift action_46
action_59 _ = happyReduce_39

action_60 (30) = happyShift action_31
action_60 (34) = happyShift action_32
action_60 (43) = happyShift action_40
action_60 (44) = happyShift action_41
action_60 (45) = happyShift action_42
action_60 (46) = happyShift action_43
action_60 (47) = happyShift action_44
action_60 (48) = happyShift action_45
action_60 (49) = happyShift action_46
action_60 _ = happyReduce_38

action_61 (30) = happyShift action_31
action_61 (34) = happyShift action_32
action_61 (39) = happyShift action_36
action_61 (40) = happyShift action_37
action_61 (41) = happyShift action_38
action_61 (42) = happyShift action_39
action_61 (43) = happyShift action_40
action_61 (44) = happyShift action_41
action_61 (45) = happyShift action_42
action_61 (46) = happyShift action_43
action_61 (47) = happyShift action_44
action_61 (48) = happyShift action_45
action_61 (49) = happyShift action_46
action_61 _ = happyReduce_37

action_62 (30) = happyShift action_31
action_62 (34) = happyShift action_32
action_62 (39) = happyShift action_36
action_62 (40) = happyShift action_37
action_62 (41) = happyShift action_38
action_62 (42) = happyShift action_39
action_62 (43) = happyShift action_40
action_62 (44) = happyShift action_41
action_62 (45) = happyShift action_42
action_62 (46) = happyShift action_43
action_62 (47) = happyShift action_44
action_62 (48) = happyShift action_45
action_62 (49) = happyShift action_46
action_62 _ = happyReduce_36

action_63 (30) = happyShift action_31
action_63 (34) = happyShift action_32
action_63 (36) = happyShift action_33
action_63 (37) = happyShift action_34
action_63 (38) = happyShift action_35
action_63 (39) = happyShift action_36
action_63 (40) = happyShift action_37
action_63 (41) = happyShift action_38
action_63 (42) = happyShift action_39
action_63 (43) = happyShift action_40
action_63 (44) = happyShift action_41
action_63 (45) = happyShift action_42
action_63 (46) = happyShift action_43
action_63 (47) = happyShift action_44
action_63 (48) = happyShift action_45
action_63 (49) = happyShift action_46
action_63 (50) = happyShift action_47
action_63 (51) = happyShift action_48
action_63 _ = happyReduce_27

action_64 (30) = happyShift action_31
action_64 (34) = happyShift action_32
action_64 (35) = happyShift action_83
action_64 (36) = happyShift action_33
action_64 (37) = happyShift action_34
action_64 (38) = happyShift action_35
action_64 (39) = happyShift action_36
action_64 (40) = happyShift action_37
action_64 (41) = happyShift action_38
action_64 (42) = happyShift action_39
action_64 (43) = happyShift action_40
action_64 (44) = happyShift action_41
action_64 (45) = happyShift action_42
action_64 (46) = happyShift action_43
action_64 (47) = happyShift action_44
action_64 (48) = happyShift action_45
action_64 (49) = happyShift action_46
action_64 (50) = happyShift action_47
action_64 (51) = happyShift action_48
action_64 _ = happyFail

action_65 (30) = happyShift action_31
action_65 (34) = happyShift action_32
action_65 (36) = happyShift action_33
action_65 (37) = happyShift action_34
action_65 (38) = happyShift action_35
action_65 (39) = happyShift action_36
action_65 (40) = happyShift action_37
action_65 (41) = happyShift action_38
action_65 (42) = happyShift action_39
action_65 (43) = happyShift action_40
action_65 (44) = happyShift action_41
action_65 (45) = happyShift action_42
action_65 (46) = happyShift action_43
action_65 (47) = happyShift action_44
action_65 (48) = happyShift action_45
action_65 (49) = happyShift action_46
action_65 (50) = happyShift action_47
action_65 (51) = happyShift action_48
action_65 _ = happyReduce_47

action_66 (31) = happyShift action_82
action_66 _ = happyFail

action_67 (29) = happyShift action_81
action_67 _ = happyReduce_46

action_68 (18) = happyShift action_80
action_68 _ = happyFail

action_69 (22) = happyShift action_79
action_69 _ = happyFail

action_70 (17) = happyShift action_10
action_70 (21) = happyShift action_11
action_70 (24) = happyShift action_12
action_70 (26) = happyShift action_13
action_70 (27) = happyShift action_14
action_70 (30) = happyShift action_15
action_70 (33) = happyShift action_78
action_70 (52) = happyShift action_16
action_70 (53) = happyShift action_17
action_70 (54) = happyShift action_18
action_70 (55) = happyShift action_19
action_70 (7) = happyGoto action_49
action_70 (9) = happyGoto action_4
action_70 (10) = happyGoto action_5
action_70 (11) = happyGoto action_6
action_70 (12) = happyGoto action_7
action_70 (13) = happyGoto action_8
action_70 (14) = happyGoto action_9
action_70 _ = happyFail

action_71 (30) = happyShift action_15
action_71 (52) = happyShift action_16
action_71 (53) = happyShift action_17
action_71 (54) = happyShift action_18
action_71 (55) = happyShift action_19
action_71 (11) = happyGoto action_77
action_71 (12) = happyGoto action_7
action_71 (13) = happyGoto action_8
action_71 (14) = happyGoto action_9
action_71 _ = happyFail

action_72 (54) = happyShift action_76
action_72 (8) = happyGoto action_75
action_72 _ = happyReduce_12

action_73 _ = happyReduce_9

action_74 _ = happyReduce_23

action_75 (29) = happyShift action_88
action_75 (31) = happyShift action_89
action_75 _ = happyFail

action_76 _ = happyReduce_13

action_77 (28) = happyShift action_87
action_77 (30) = happyShift action_31
action_77 (34) = happyShift action_32
action_77 (36) = happyShift action_33
action_77 (37) = happyShift action_34
action_77 (38) = happyShift action_35
action_77 (39) = happyShift action_36
action_77 (40) = happyShift action_37
action_77 (41) = happyShift action_38
action_77 (42) = happyShift action_39
action_77 (43) = happyShift action_40
action_77 (44) = happyShift action_41
action_77 (45) = happyShift action_42
action_77 (46) = happyShift action_43
action_77 (47) = happyShift action_44
action_77 (48) = happyShift action_45
action_77 (49) = happyShift action_46
action_77 (50) = happyShift action_47
action_77 (51) = happyShift action_48
action_77 _ = happyFail

action_78 _ = happyReduce_4

action_79 (17) = happyShift action_10
action_79 (21) = happyShift action_11
action_79 (24) = happyShift action_12
action_79 (26) = happyShift action_13
action_79 (27) = happyShift action_14
action_79 (30) = happyShift action_15
action_79 (32) = happyShift action_27
action_79 (52) = happyShift action_16
action_79 (53) = happyShift action_17
action_79 (54) = happyShift action_18
action_79 (55) = happyShift action_19
action_79 (5) = happyGoto action_86
action_79 (7) = happyGoto action_26
action_79 (9) = happyGoto action_4
action_79 (10) = happyGoto action_5
action_79 (11) = happyGoto action_6
action_79 (12) = happyGoto action_7
action_79 (13) = happyGoto action_8
action_79 (14) = happyGoto action_9
action_79 _ = happyReduce_2

action_80 (17) = happyShift action_10
action_80 (21) = happyShift action_11
action_80 (24) = happyShift action_12
action_80 (26) = happyShift action_13
action_80 (27) = happyShift action_14
action_80 (30) = happyShift action_15
action_80 (32) = happyShift action_27
action_80 (52) = happyShift action_16
action_80 (53) = happyShift action_17
action_80 (54) = happyShift action_18
action_80 (55) = happyShift action_19
action_80 (5) = happyGoto action_85
action_80 (7) = happyGoto action_26
action_80 (9) = happyGoto action_4
action_80 (10) = happyGoto action_5
action_80 (11) = happyGoto action_6
action_80 (12) = happyGoto action_7
action_80 (13) = happyGoto action_8
action_80 (14) = happyGoto action_9
action_80 _ = happyReduce_2

action_81 (30) = happyShift action_15
action_81 (52) = happyShift action_16
action_81 (53) = happyShift action_17
action_81 (54) = happyShift action_18
action_81 (55) = happyShift action_19
action_81 (11) = happyGoto action_84
action_81 (12) = happyGoto action_7
action_81 (13) = happyGoto action_8
action_81 (14) = happyGoto action_9
action_81 _ = happyFail

action_82 _ = happyReduce_20

action_83 _ = happyReduce_21

action_84 (30) = happyShift action_31
action_84 (34) = happyShift action_32
action_84 (36) = happyShift action_33
action_84 (37) = happyShift action_34
action_84 (38) = happyShift action_35
action_84 (39) = happyShift action_36
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
action_84 _ = happyReduce_48

action_85 (19) = happyShift action_93
action_85 (20) = happyShift action_94
action_85 _ = happyFail

action_86 (23) = happyShift action_92
action_86 _ = happyFail

action_87 _ = happyReduce_18

action_88 (54) = happyShift action_91
action_88 _ = happyFail

action_89 (17) = happyShift action_10
action_89 (21) = happyShift action_11
action_89 (24) = happyShift action_12
action_89 (26) = happyShift action_13
action_89 (27) = happyShift action_14
action_89 (30) = happyShift action_15
action_89 (32) = happyShift action_27
action_89 (52) = happyShift action_16
action_89 (53) = happyShift action_17
action_89 (54) = happyShift action_18
action_89 (55) = happyShift action_19
action_89 (5) = happyGoto action_90
action_89 (7) = happyGoto action_26
action_89 (9) = happyGoto action_4
action_89 (10) = happyGoto action_5
action_89 (11) = happyGoto action_6
action_89 (12) = happyGoto action_7
action_89 (13) = happyGoto action_8
action_89 (14) = happyGoto action_9
action_89 _ = happyReduce_2

action_90 _ = happyReduce_10

action_91 _ = happyReduce_14

action_92 _ = happyReduce_17

action_93 (17) = happyShift action_10
action_93 (21) = happyShift action_11
action_93 (24) = happyShift action_12
action_93 (26) = happyShift action_13
action_93 (27) = happyShift action_14
action_93 (30) = happyShift action_15
action_93 (32) = happyShift action_27
action_93 (52) = happyShift action_16
action_93 (53) = happyShift action_17
action_93 (54) = happyShift action_18
action_93 (55) = happyShift action_19
action_93 (5) = happyGoto action_95
action_93 (7) = happyGoto action_26
action_93 (9) = happyGoto action_4
action_93 (10) = happyGoto action_5
action_93 (11) = happyGoto action_6
action_93 (12) = happyGoto action_7
action_93 (13) = happyGoto action_8
action_93 (14) = happyGoto action_9
action_93 _ = happyReduce_2

action_94 _ = happyReduce_16

action_95 (20) = happyShift action_96
action_95 _ = happyFail

action_96 _ = happyReduce_15

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

happyReduce_19 = happySpecReduce_1  11 happyReduction_19
happyReduction_19 (HappyTerminal (TokenStringLit happy_var_1))
	 =  HappyAbsSyn11
		 (ExpressionConstant (ConstantString happy_var_1)
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happyReduce 4 11 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (ExpressionFunctionCall happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 4 11 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (ExpressionArrayAccess happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_1  11 happyReduction_22
happyReduction_22 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn11
		 (ExpressionConstant (ConstantInt happy_var_1)
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  11 happyReduction_23
happyReduction_23 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (happy_var_2
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  11 happyReduction_24
happyReduction_24 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  11 happyReduction_25
happyReduction_25 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  11 happyReduction_26
happyReduction_26 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  11 happyReduction_27
happyReduction_27 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionAssign happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  11 happyReduction_28
happyReduction_28 (HappyTerminal (TokenWord happy_var_1))
	 =  HappyAbsSyn11
		 (ExpressionVar happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_2  12 happyReduction_29
happyReduction_29 _
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionArithInc happy_var_1
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_2  12 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionArithDec happy_var_1
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  12 happyReduction_31
happyReduction_31 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionArithPlus happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  12 happyReduction_32
happyReduction_32 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionArithMinus happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  12 happyReduction_33
happyReduction_33 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionArithMul happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  12 happyReduction_34
happyReduction_34 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionArithDiv happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  12 happyReduction_35
happyReduction_35 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionArithMod happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  13 happyReduction_36
happyReduction_36 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionCompareEq happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  13 happyReduction_37
happyReduction_37 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionCompareNeq happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  13 happyReduction_38
happyReduction_38 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionCompareLt  happy_var_1 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  13 happyReduction_39
happyReduction_39 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionCompareLeq happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  13 happyReduction_40
happyReduction_40 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionCompareGt happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  13 happyReduction_41
happyReduction_41 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionCompareGeq happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  14 happyReduction_42
happyReduction_42 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionLogicAnd happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  14 happyReduction_43
happyReduction_43 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionLogicOr happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_2  14 happyReduction_44
happyReduction_44 (HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (ExpressionLogicNot happy_var_2
	)
happyReduction_44 _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_0  15 happyReduction_45
happyReduction_45  =  HappyAbsSyn15
		 ([]
	)

happyReduce_46 = happySpecReduce_1  15 happyReduction_46
happyReduction_46 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  16 happyReduction_47
happyReduction_47 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 : []
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  16 happyReduction_48
happyReduction_48 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_3 : happy_var_1
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 56 56 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenIf -> cont 17;
	TokenThen -> cont 18;
	TokenElse -> cont 19;
	TokenFi -> cont 20;
	TokenWhile -> cont 21;
	TokenDo -> cont 22;
	TokenOd -> cont 23;
	TokenRepeat -> cont 24;
	TokenUntil -> cont 25;
	TokenFunction -> cont 26;
	TokenReturn -> cont 27;
	TokenSemicolon -> cont 28;
	TokenComma -> cont 29;
	TokenRBOpen -> cont 30;
	TokenRBClose -> cont 31;
	TokenCBOpen -> cont 32;
	TokenCBClose -> cont 33;
	TokenSBOpen -> cont 34;
	TokenSBClose -> cont 35;
	TokenLeftarrow -> cont 36;
	TokenCompEq -> cont 37;
	TokenCompNeq -> cont 38;
	TokenCompLt -> cont 39;
	TokenCompLeq -> cont 40;
	TokenCompGt -> cont 41;
	TokenCompGeq -> cont 42;
	TokenArithPlus -> cont 43;
	TokenArithMinus -> cont 44;
	TokenArithMul -> cont 45;
	TokenArithDiv -> cont 46;
	TokenArithMod -> cont 47;
	TokenArithInc -> cont 48;
	TokenArithDec -> cont 49;
	TokenLogicAnd -> cont 50;
	TokenLogicOr -> cont 51;
	TokenLogicNot -> cont 52;
	TokenInt happy_dollar_dollar -> cont 53;
	TokenWord happy_dollar_dollar -> cont 54;
	TokenStringLit happy_dollar_dollar -> cont 55;
	_ -> happyError' (tk:tks)
	}

happyError_ 56 tk tks = happyError' tks
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
