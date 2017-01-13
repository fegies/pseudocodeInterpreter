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
	| HappyAbsSyn4 (Statement)
	| HappyAbsSyn7 (StatementFor)
	| HappyAbsSyn8 (Block)
	| HappyAbsSyn9 ([Statement])
	| HappyAbsSyn10 (Expression)

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
 action_92 :: () => Int -> ({-HappyReduction (HappyIdentity) = -}
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
 happyReduce_39 :: () => ({-HappyReduction (HappyIdentity) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (HappyIdentity) HappyAbsSyn)

action_0 (11) = happyShift action_3
action_0 (15) = happyShift action_8
action_0 (18) = happyShift action_9
action_0 (24) = happyShift action_10
action_0 (33) = happyShift action_11
action_0 (48) = happyShift action_12
action_0 (49) = happyShift action_13
action_0 (50) = happyShift action_14
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_5
action_0 (7) = happyGoto action_6
action_0 (10) = happyGoto action_7
action_0 _ = happyFail

action_1 (11) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail

action_2 _ = happyReduce_1

action_3 (24) = happyShift action_10
action_3 (33) = happyShift action_11
action_3 (48) = happyShift action_12
action_3 (49) = happyShift action_13
action_3 (50) = happyShift action_14
action_3 (10) = happyGoto action_41
action_3 _ = happyFail

action_4 (51) = happyAccept
action_4 _ = happyFail

action_5 _ = happyReduce_2

action_6 _ = happyReduce_3

action_7 (21) = happyShift action_21
action_7 (22) = happyShift action_22
action_7 (23) = happyShift action_23
action_7 (24) = happyShift action_24
action_7 (28) = happyShift action_25
action_7 (31) = happyShift action_26
action_7 (32) = happyShift action_27
action_7 (34) = happyShift action_28
action_7 (35) = happyShift action_29
action_7 (36) = happyShift action_30
action_7 (37) = happyShift action_31
action_7 (38) = happyShift action_32
action_7 (39) = happyShift action_33
action_7 (40) = happyShift action_34
action_7 (41) = happyShift action_35
action_7 (42) = happyShift action_36
action_7 (43) = happyShift action_37
action_7 (44) = happyShift action_38
action_7 (45) = happyShift action_39
action_7 (46) = happyShift action_40
action_7 _ = happyFail

action_8 (24) = happyShift action_10
action_8 (33) = happyShift action_11
action_8 (48) = happyShift action_12
action_8 (49) = happyShift action_13
action_8 (50) = happyShift action_14
action_8 (10) = happyGoto action_20
action_8 _ = happyFail

action_9 (50) = happyShift action_19
action_9 _ = happyFail

action_10 (24) = happyShift action_10
action_10 (33) = happyShift action_11
action_10 (48) = happyShift action_12
action_10 (49) = happyShift action_13
action_10 (50) = happyShift action_14
action_10 (10) = happyGoto action_18
action_10 _ = happyFail

action_11 (24) = happyShift action_10
action_11 (33) = happyShift action_11
action_11 (48) = happyShift action_12
action_11 (49) = happyShift action_13
action_11 (50) = happyShift action_14
action_11 (10) = happyGoto action_17
action_11 _ = happyFail

action_12 (50) = happyShift action_16
action_12 _ = happyFail

action_13 _ = happyReduce_17

action_14 (30) = happyShift action_15
action_14 _ = happyReduce_18

action_15 (24) = happyShift action_10
action_15 (33) = happyShift action_11
action_15 (48) = happyShift action_12
action_15 (49) = happyShift action_13
action_15 (50) = happyShift action_14
action_15 (10) = happyGoto action_64
action_15 _ = happyFail

action_16 (48) = happyShift action_63
action_16 _ = happyFail

action_17 (22) = happyShift action_22
action_17 (24) = happyShift action_24
action_17 (28) = happyShift action_25
action_17 (40) = happyShift action_34
action_17 (41) = happyShift action_35
action_17 _ = happyReduce_30

action_18 (22) = happyShift action_22
action_18 (23) = happyShift action_23
action_18 (24) = happyShift action_24
action_18 (25) = happyShift action_62
action_18 (28) = happyShift action_25
action_18 (31) = happyShift action_26
action_18 (32) = happyShift action_27
action_18 (34) = happyShift action_28
action_18 (35) = happyShift action_29
action_18 (36) = happyShift action_30
action_18 (37) = happyShift action_31
action_18 (38) = happyShift action_32
action_18 (39) = happyShift action_33
action_18 (40) = happyShift action_34
action_18 (41) = happyShift action_35
action_18 (42) = happyShift action_36
action_18 (43) = happyShift action_37
action_18 (44) = happyShift action_38
action_18 (45) = happyShift action_39
action_18 (46) = happyShift action_40
action_18 _ = happyFail

action_19 (47) = happyShift action_61
action_19 _ = happyFail

action_20 (21) = happyShift action_60
action_20 (22) = happyShift action_22
action_20 (23) = happyShift action_23
action_20 (24) = happyShift action_24
action_20 (28) = happyShift action_25
action_20 (31) = happyShift action_26
action_20 (32) = happyShift action_27
action_20 (34) = happyShift action_28
action_20 (35) = happyShift action_29
action_20 (36) = happyShift action_30
action_20 (37) = happyShift action_31
action_20 (38) = happyShift action_32
action_20 (39) = happyShift action_33
action_20 (40) = happyShift action_34
action_20 (41) = happyShift action_35
action_20 (42) = happyShift action_36
action_20 (43) = happyShift action_37
action_20 (44) = happyShift action_38
action_20 (45) = happyShift action_39
action_20 (46) = happyShift action_40
action_20 _ = happyFail

action_21 _ = happyReduce_4

action_22 (50) = happyShift action_59
action_22 _ = happyFail

action_23 (24) = happyShift action_10
action_23 (33) = happyShift action_11
action_23 (48) = happyShift action_12
action_23 (49) = happyShift action_13
action_23 (50) = happyShift action_14
action_23 (10) = happyGoto action_58
action_23 _ = happyFail

action_24 (24) = happyShift action_10
action_24 (33) = happyShift action_11
action_24 (48) = happyShift action_12
action_24 (49) = happyShift action_13
action_24 (50) = happyShift action_14
action_24 (10) = happyGoto action_57
action_24 _ = happyFail

action_25 (24) = happyShift action_10
action_25 (33) = happyShift action_11
action_25 (48) = happyShift action_12
action_25 (49) = happyShift action_13
action_25 (50) = happyShift action_14
action_25 (10) = happyGoto action_56
action_25 _ = happyFail

action_26 (24) = happyShift action_10
action_26 (33) = happyShift action_11
action_26 (48) = happyShift action_12
action_26 (49) = happyShift action_13
action_26 (50) = happyShift action_14
action_26 (10) = happyGoto action_55
action_26 _ = happyFail

action_27 (24) = happyShift action_10
action_27 (33) = happyShift action_11
action_27 (48) = happyShift action_12
action_27 (49) = happyShift action_13
action_27 (50) = happyShift action_14
action_27 (10) = happyGoto action_54
action_27 _ = happyFail

action_28 (24) = happyShift action_10
action_28 (33) = happyShift action_11
action_28 (48) = happyShift action_12
action_28 (49) = happyShift action_13
action_28 (50) = happyShift action_14
action_28 (10) = happyGoto action_53
action_28 _ = happyFail

action_29 (24) = happyShift action_10
action_29 (33) = happyShift action_11
action_29 (48) = happyShift action_12
action_29 (49) = happyShift action_13
action_29 (50) = happyShift action_14
action_29 (10) = happyGoto action_52
action_29 _ = happyFail

action_30 (24) = happyShift action_10
action_30 (33) = happyShift action_11
action_30 (48) = happyShift action_12
action_30 (49) = happyShift action_13
action_30 (50) = happyShift action_14
action_30 (10) = happyGoto action_51
action_30 _ = happyFail

action_31 (24) = happyShift action_10
action_31 (33) = happyShift action_11
action_31 (48) = happyShift action_12
action_31 (49) = happyShift action_13
action_31 (50) = happyShift action_14
action_31 (10) = happyGoto action_50
action_31 _ = happyFail

action_32 (24) = happyShift action_10
action_32 (33) = happyShift action_11
action_32 (48) = happyShift action_12
action_32 (49) = happyShift action_13
action_32 (50) = happyShift action_14
action_32 (10) = happyGoto action_49
action_32 _ = happyFail

action_33 (24) = happyShift action_10
action_33 (33) = happyShift action_11
action_33 (48) = happyShift action_12
action_33 (49) = happyShift action_13
action_33 (50) = happyShift action_14
action_33 (10) = happyGoto action_48
action_33 _ = happyFail

action_34 _ = happyReduce_38

action_35 _ = happyReduce_39

action_36 (24) = happyShift action_10
action_36 (33) = happyShift action_11
action_36 (48) = happyShift action_12
action_36 (49) = happyShift action_13
action_36 (50) = happyShift action_14
action_36 (10) = happyGoto action_47
action_36 _ = happyFail

action_37 (24) = happyShift action_10
action_37 (33) = happyShift action_11
action_37 (48) = happyShift action_12
action_37 (49) = happyShift action_13
action_37 (50) = happyShift action_14
action_37 (10) = happyGoto action_46
action_37 _ = happyFail

action_38 (24) = happyShift action_10
action_38 (33) = happyShift action_11
action_38 (48) = happyShift action_12
action_38 (49) = happyShift action_13
action_38 (50) = happyShift action_14
action_38 (10) = happyGoto action_45
action_38 _ = happyFail

action_39 (24) = happyShift action_10
action_39 (33) = happyShift action_11
action_39 (48) = happyShift action_12
action_39 (49) = happyShift action_13
action_39 (50) = happyShift action_14
action_39 (10) = happyGoto action_44
action_39 _ = happyFail

action_40 (24) = happyShift action_10
action_40 (33) = happyShift action_11
action_40 (48) = happyShift action_12
action_40 (49) = happyShift action_13
action_40 (50) = happyShift action_14
action_40 (10) = happyGoto action_43
action_40 _ = happyFail

action_41 (21) = happyShift action_42
action_41 (22) = happyShift action_22
action_41 (23) = happyShift action_23
action_41 (24) = happyShift action_24
action_41 (28) = happyShift action_25
action_41 (31) = happyShift action_26
action_41 (32) = happyShift action_27
action_41 (34) = happyShift action_28
action_41 (35) = happyShift action_29
action_41 (36) = happyShift action_30
action_41 (37) = happyShift action_31
action_41 (38) = happyShift action_32
action_41 (39) = happyShift action_33
action_41 (40) = happyShift action_34
action_41 (41) = happyShift action_35
action_41 (42) = happyShift action_36
action_41 (43) = happyShift action_37
action_41 (44) = happyShift action_38
action_41 (45) = happyShift action_39
action_41 (46) = happyShift action_40
action_41 _ = happyFail

action_42 (12) = happyShift action_69
action_42 _ = happyFail

action_43 (22) = happyShift action_22
action_43 (24) = happyShift action_24
action_43 (28) = happyShift action_25
action_43 (40) = happyShift action_34
action_43 (41) = happyShift action_35
action_43 _ = happyReduce_37

action_44 (22) = happyShift action_22
action_44 (24) = happyShift action_24
action_44 (28) = happyShift action_25
action_44 (40) = happyShift action_34
action_44 (41) = happyShift action_35
action_44 _ = happyReduce_36

action_45 (22) = happyShift action_22
action_45 (24) = happyShift action_24
action_45 (28) = happyShift action_25
action_45 (40) = happyShift action_34
action_45 (41) = happyShift action_35
action_45 _ = happyReduce_35

action_46 (22) = happyShift action_22
action_46 (24) = happyShift action_24
action_46 (28) = happyShift action_25
action_46 (40) = happyShift action_34
action_46 (41) = happyShift action_35
action_46 (44) = happyShift action_38
action_46 (45) = happyShift action_39
action_46 (46) = happyShift action_40
action_46 _ = happyReduce_34

action_47 (22) = happyShift action_22
action_47 (24) = happyShift action_24
action_47 (28) = happyShift action_25
action_47 (40) = happyShift action_34
action_47 (41) = happyShift action_35
action_47 (44) = happyShift action_38
action_47 (45) = happyShift action_39
action_47 (46) = happyShift action_40
action_47 _ = happyReduce_33

action_48 (22) = happyShift action_22
action_48 (24) = happyShift action_24
action_48 (28) = happyShift action_25
action_48 (36) = happyShift action_30
action_48 (37) = happyShift action_31
action_48 (40) = happyShift action_34
action_48 (41) = happyShift action_35
action_48 (42) = happyShift action_36
action_48 (43) = happyShift action_37
action_48 (44) = happyShift action_38
action_48 (45) = happyShift action_39
action_48 (46) = happyShift action_40
action_48 _ = happyReduce_29

action_49 (22) = happyShift action_22
action_49 (24) = happyShift action_24
action_49 (28) = happyShift action_25
action_49 (36) = happyShift action_30
action_49 (37) = happyShift action_31
action_49 (40) = happyShift action_34
action_49 (41) = happyShift action_35
action_49 (42) = happyShift action_36
action_49 (43) = happyShift action_37
action_49 (44) = happyShift action_38
action_49 (45) = happyShift action_39
action_49 (46) = happyShift action_40
action_49 _ = happyReduce_27

action_50 (22) = happyShift action_22
action_50 (24) = happyShift action_24
action_50 (28) = happyShift action_25
action_50 (40) = happyShift action_34
action_50 (41) = happyShift action_35
action_50 (42) = happyShift action_36
action_50 (43) = happyShift action_37
action_50 (44) = happyShift action_38
action_50 (45) = happyShift action_39
action_50 (46) = happyShift action_40
action_50 _ = happyReduce_28

action_51 (22) = happyShift action_22
action_51 (24) = happyShift action_24
action_51 (28) = happyShift action_25
action_51 (40) = happyShift action_34
action_51 (41) = happyShift action_35
action_51 (42) = happyShift action_36
action_51 (43) = happyShift action_37
action_51 (44) = happyShift action_38
action_51 (45) = happyShift action_39
action_51 (46) = happyShift action_40
action_51 _ = happyReduce_26

action_52 (22) = happyShift action_22
action_52 (24) = happyShift action_24
action_52 (28) = happyShift action_25
action_52 (31) = happyShift action_26
action_52 (32) = happyShift action_27
action_52 (34) = happyShift action_28
action_52 (36) = happyShift action_30
action_52 (37) = happyShift action_31
action_52 (38) = happyShift action_32
action_52 (39) = happyShift action_33
action_52 (40) = happyShift action_34
action_52 (41) = happyShift action_35
action_52 (42) = happyShift action_36
action_52 (43) = happyShift action_37
action_52 (44) = happyShift action_38
action_52 (45) = happyShift action_39
action_52 (46) = happyShift action_40
action_52 _ = happyReduce_32

action_53 (22) = happyShift action_22
action_53 (24) = happyShift action_24
action_53 (28) = happyShift action_25
action_53 (31) = happyShift action_26
action_53 (32) = happyShift action_27
action_53 (36) = happyShift action_30
action_53 (37) = happyShift action_31
action_53 (38) = happyShift action_32
action_53 (39) = happyShift action_33
action_53 (40) = happyShift action_34
action_53 (41) = happyShift action_35
action_53 (42) = happyShift action_36
action_53 (43) = happyShift action_37
action_53 (44) = happyShift action_38
action_53 (45) = happyShift action_39
action_53 (46) = happyShift action_40
action_53 _ = happyReduce_31

action_54 (22) = happyShift action_22
action_54 (24) = happyShift action_24
action_54 (28) = happyShift action_25
action_54 (36) = happyShift action_30
action_54 (37) = happyShift action_31
action_54 (38) = happyShift action_32
action_54 (39) = happyShift action_33
action_54 (40) = happyShift action_34
action_54 (41) = happyShift action_35
action_54 (42) = happyShift action_36
action_54 (43) = happyShift action_37
action_54 (44) = happyShift action_38
action_54 (45) = happyShift action_39
action_54 (46) = happyShift action_40
action_54 _ = happyReduce_25

action_55 (22) = happyShift action_22
action_55 (24) = happyShift action_24
action_55 (28) = happyShift action_25
action_55 (36) = happyShift action_30
action_55 (37) = happyShift action_31
action_55 (38) = happyShift action_32
action_55 (39) = happyShift action_33
action_55 (40) = happyShift action_34
action_55 (41) = happyShift action_35
action_55 (42) = happyShift action_36
action_55 (43) = happyShift action_37
action_55 (44) = happyShift action_38
action_55 (45) = happyShift action_39
action_55 (46) = happyShift action_40
action_55 _ = happyReduce_24

action_56 (22) = happyShift action_22
action_56 (23) = happyShift action_23
action_56 (24) = happyShift action_24
action_56 (28) = happyShift action_25
action_56 (29) = happyShift action_68
action_56 (31) = happyShift action_26
action_56 (32) = happyShift action_27
action_56 (34) = happyShift action_28
action_56 (35) = happyShift action_29
action_56 (36) = happyShift action_30
action_56 (37) = happyShift action_31
action_56 (38) = happyShift action_32
action_56 (39) = happyShift action_33
action_56 (40) = happyShift action_34
action_56 (41) = happyShift action_35
action_56 (42) = happyShift action_36
action_56 (43) = happyShift action_37
action_56 (44) = happyShift action_38
action_56 (45) = happyShift action_39
action_56 (46) = happyShift action_40
action_56 _ = happyFail

action_57 (22) = happyShift action_22
action_57 (23) = happyShift action_23
action_57 (24) = happyShift action_24
action_57 (25) = happyShift action_67
action_57 (28) = happyShift action_25
action_57 (31) = happyShift action_26
action_57 (32) = happyShift action_27
action_57 (34) = happyShift action_28
action_57 (35) = happyShift action_29
action_57 (36) = happyShift action_30
action_57 (37) = happyShift action_31
action_57 (38) = happyShift action_32
action_57 (39) = happyShift action_33
action_57 (40) = happyShift action_34
action_57 (41) = happyShift action_35
action_57 (42) = happyShift action_36
action_57 (43) = happyShift action_37
action_57 (44) = happyShift action_38
action_57 (45) = happyShift action_39
action_57 (46) = happyShift action_40
action_57 _ = happyFail

action_58 (22) = happyShift action_22
action_58 (24) = happyShift action_24
action_58 (28) = happyShift action_25
action_58 (31) = happyShift action_26
action_58 (32) = happyShift action_27
action_58 (34) = happyShift action_28
action_58 (35) = happyShift action_29
action_58 (36) = happyShift action_30
action_58 (37) = happyShift action_31
action_58 (38) = happyShift action_32
action_58 (39) = happyShift action_33
action_58 (40) = happyShift action_34
action_58 (41) = happyShift action_35
action_58 (42) = happyShift action_36
action_58 (43) = happyShift action_37
action_58 (44) = happyShift action_38
action_58 (45) = happyShift action_39
action_58 (46) = happyShift action_40
action_58 _ = happyReduce_23

action_59 _ = happyReduce_21

action_60 (16) = happyShift action_66
action_60 _ = happyFail

action_61 (49) = happyShift action_65
action_61 _ = happyFail

action_62 _ = happyReduce_15

action_63 _ = happyReduce_16

action_64 (22) = happyShift action_22
action_64 (24) = happyShift action_24
action_64 (28) = happyShift action_25
action_64 (31) = happyShift action_26
action_64 (32) = happyShift action_27
action_64 (34) = happyShift action_28
action_64 (35) = happyShift action_29
action_64 (36) = happyShift action_30
action_64 (37) = happyShift action_31
action_64 (38) = happyShift action_32
action_64 (39) = happyShift action_33
action_64 (40) = happyShift action_34
action_64 (41) = happyShift action_35
action_64 (42) = happyShift action_36
action_64 (43) = happyShift action_37
action_64 (44) = happyShift action_38
action_64 (45) = happyShift action_39
action_64 (46) = happyShift action_40
action_64 _ = happyReduce_19

action_65 (19) = happyShift action_74
action_65 (20) = happyShift action_75
action_65 _ = happyFail

action_66 (11) = happyShift action_3
action_66 (15) = happyShift action_8
action_66 (18) = happyShift action_9
action_66 (24) = happyShift action_10
action_66 (26) = happyShift action_72
action_66 (33) = happyShift action_11
action_66 (48) = happyShift action_12
action_66 (49) = happyShift action_13
action_66 (50) = happyShift action_14
action_66 (4) = happyGoto action_70
action_66 (5) = happyGoto action_2
action_66 (6) = happyGoto action_5
action_66 (7) = happyGoto action_6
action_66 (8) = happyGoto action_73
action_66 (10) = happyGoto action_7
action_66 _ = happyReduce_10

action_67 _ = happyReduce_22

action_68 _ = happyReduce_20

action_69 (11) = happyShift action_3
action_69 (15) = happyShift action_8
action_69 (18) = happyShift action_9
action_69 (24) = happyShift action_10
action_69 (26) = happyShift action_72
action_69 (33) = happyShift action_11
action_69 (48) = happyShift action_12
action_69 (49) = happyShift action_13
action_69 (50) = happyShift action_14
action_69 (4) = happyGoto action_70
action_69 (5) = happyGoto action_2
action_69 (6) = happyGoto action_5
action_69 (7) = happyGoto action_6
action_69 (8) = happyGoto action_71
action_69 (10) = happyGoto action_7
action_69 _ = happyReduce_10

action_70 _ = happyReduce_11

action_71 (13) = happyShift action_81
action_71 (14) = happyShift action_82
action_71 _ = happyFail

action_72 (11) = happyShift action_3
action_72 (15) = happyShift action_8
action_72 (18) = happyShift action_9
action_72 (24) = happyShift action_10
action_72 (33) = happyShift action_11
action_72 (48) = happyShift action_12
action_72 (49) = happyShift action_13
action_72 (50) = happyShift action_14
action_72 (4) = happyGoto action_79
action_72 (5) = happyGoto action_2
action_72 (6) = happyGoto action_5
action_72 (7) = happyGoto action_6
action_72 (9) = happyGoto action_80
action_72 (10) = happyGoto action_7
action_72 _ = happyFail

action_73 (17) = happyShift action_78
action_73 _ = happyFail

action_74 (49) = happyShift action_77
action_74 _ = happyFail

action_75 (49) = happyShift action_76
action_75 _ = happyFail

action_76 (16) = happyShift action_87
action_76 _ = happyFail

action_77 (16) = happyShift action_86
action_77 _ = happyFail

action_78 _ = happyReduce_7

action_79 _ = happyReduce_13

action_80 (11) = happyShift action_3
action_80 (15) = happyShift action_8
action_80 (18) = happyShift action_9
action_80 (24) = happyShift action_10
action_80 (27) = happyShift action_85
action_80 (33) = happyShift action_11
action_80 (48) = happyShift action_12
action_80 (49) = happyShift action_13
action_80 (50) = happyShift action_14
action_80 (4) = happyGoto action_84
action_80 (5) = happyGoto action_2
action_80 (6) = happyGoto action_5
action_80 (7) = happyGoto action_6
action_80 (10) = happyGoto action_7
action_80 _ = happyFail

action_81 (11) = happyShift action_3
action_81 (15) = happyShift action_8
action_81 (18) = happyShift action_9
action_81 (24) = happyShift action_10
action_81 (26) = happyShift action_72
action_81 (33) = happyShift action_11
action_81 (48) = happyShift action_12
action_81 (49) = happyShift action_13
action_81 (50) = happyShift action_14
action_81 (4) = happyGoto action_70
action_81 (5) = happyGoto action_2
action_81 (6) = happyGoto action_5
action_81 (7) = happyGoto action_6
action_81 (8) = happyGoto action_83
action_81 (10) = happyGoto action_7
action_81 _ = happyReduce_10

action_82 _ = happyReduce_6

action_83 (14) = happyShift action_90
action_83 _ = happyFail

action_84 _ = happyReduce_14

action_85 _ = happyReduce_12

action_86 (11) = happyShift action_3
action_86 (15) = happyShift action_8
action_86 (18) = happyShift action_9
action_86 (24) = happyShift action_10
action_86 (26) = happyShift action_72
action_86 (33) = happyShift action_11
action_86 (48) = happyShift action_12
action_86 (49) = happyShift action_13
action_86 (50) = happyShift action_14
action_86 (4) = happyGoto action_70
action_86 (5) = happyGoto action_2
action_86 (6) = happyGoto action_5
action_86 (7) = happyGoto action_6
action_86 (8) = happyGoto action_89
action_86 (10) = happyGoto action_7
action_86 _ = happyReduce_10

action_87 (11) = happyShift action_3
action_87 (15) = happyShift action_8
action_87 (18) = happyShift action_9
action_87 (24) = happyShift action_10
action_87 (26) = happyShift action_72
action_87 (33) = happyShift action_11
action_87 (48) = happyShift action_12
action_87 (49) = happyShift action_13
action_87 (50) = happyShift action_14
action_87 (4) = happyGoto action_70
action_87 (5) = happyGoto action_2
action_87 (6) = happyGoto action_5
action_87 (7) = happyGoto action_6
action_87 (8) = happyGoto action_88
action_87 (10) = happyGoto action_7
action_87 _ = happyReduce_10

action_88 (17) = happyShift action_92
action_88 _ = happyFail

action_89 (17) = happyShift action_91
action_89 _ = happyFail

action_90 _ = happyReduce_5

action_91 _ = happyReduce_8

action_92 _ = happyReduce_9

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn4
		 (StatementFor happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_2  4 happyReduction_4
happyReduction_4 _
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn4
		 (StatementExpr happy_var_1
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happyReduce 8 5 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (StatementIf happy_var_2 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 6 5 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (StatementIf happy_var_2 happy_var_5 []
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 6 6 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (StatementWhile happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 9 7 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_6)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (ForTo happy_var_2 happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 9 7 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_6)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenWord happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (ForDownto happy_var_2 happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_0  8 happyReduction_10
happyReduction_10  =  HappyAbsSyn8
		 ([]
	)

happyReduce_11 = happySpecReduce_1  8 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1:[]
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  8 happyReduction_12
happyReduction_12 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  9 happyReduction_13
happyReduction_13 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1:[]
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  9 happyReduction_14
happyReduction_14 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_2:happy_var_1
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  10 happyReduction_15
happyReduction_15 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (happy_var_2
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  10 happyReduction_16
happyReduction_16 _
	(HappyTerminal (TokenWord happy_var_2))
	_
	 =  HappyAbsSyn10
		 (ExprConst (Vs happy_var_2)
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  10 happyReduction_17
happyReduction_17 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn10
		 (ExprConst (Vi happy_var_1)
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  10 happyReduction_18
happyReduction_18 (HappyTerminal (TokenWord happy_var_1))
	 =  HappyAbsSyn10
		 (ExprLookup happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  10 happyReduction_19
happyReduction_19 (HappyAbsSyn10  happy_var_3)
	_
	(HappyTerminal (TokenWord happy_var_1))
	 =  HappyAbsSyn10
		 (ExprAssign happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 4 10 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (ExprArrayAccess happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_3  10 happyReduction_21
happyReduction_21 (HappyTerminal (TokenWord happy_var_3))
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ExprMemberAccess happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happyReduce 4 10 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (ExprFunctionCall happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_3  10 happyReduction_23
happyReduction_23 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ExprCollection happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  10 happyReduction_24
happyReduction_24 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ExprCompEq happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  10 happyReduction_25
happyReduction_25 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ExprCompNeq happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  10 happyReduction_26
happyReduction_26 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ExprCompLeq happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  10 happyReduction_27
happyReduction_27 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ExprCompGeq happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  10 happyReduction_28
happyReduction_28 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ExprCompLt happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  10 happyReduction_29
happyReduction_29 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ExprCompGt happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_2  10 happyReduction_30
happyReduction_30 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (ExprNot happy_var_2
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  10 happyReduction_31
happyReduction_31 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ExprAnd happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  10 happyReduction_32
happyReduction_32 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ExprOr happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  10 happyReduction_33
happyReduction_33 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ExprPlus happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  10 happyReduction_34
happyReduction_34 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ExprMinus happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  10 happyReduction_35
happyReduction_35 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ExprMult happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  10 happyReduction_36
happyReduction_36 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ExprDiv happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  10 happyReduction_37
happyReduction_37 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ExprMod happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_2  10 happyReduction_38
happyReduction_38 _
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ExprInc happy_var_1
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_2  10 happyReduction_39
happyReduction_39 _
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ExprDec happy_var_1
	)
happyReduction_39 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 51 51 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenIf -> cont 11;
	TokenThen -> cont 12;
	TokenElse -> cont 13;
	TokenFi -> cont 14;
	TokenWhile -> cont 15;
	TokenDo -> cont 16;
	TokenOd -> cont 17;
	TokenFor -> cont 18;
	TokenTo -> cont 19;
	TokenDownto -> cont 20;
	TokenSemicolon -> cont 21;
	TokenDot -> cont 22;
	TokenComma -> cont 23;
	TokenRBOpen -> cont 24;
	TokenRBClose -> cont 25;
	TokenCBOpen -> cont 26;
	TokenCBClose -> cont 27;
	TokenSBOpen -> cont 28;
	TokenSBClose -> cont 29;
	TokenLeftarrow -> cont 30;
	TokenEq -> cont 31;
	TokenNeq -> cont 32;
	TokenNot -> cont 33;
	TokenAnd -> cont 34;
	TokenOr -> cont 35;
	TokenLeq -> cont 36;
	TokenLt -> cont 37;
	TokenGeq -> cont 38;
	TokenGt -> cont 39;
	TokenInc -> cont 40;
	TokenDec -> cont 41;
	TokenPlus -> cont 42;
	TokenMinus -> cont 43;
	TokenMult -> cont 44;
	TokenDiv -> cont 45;
	TokenMod -> cont 46;
	TokenEqualSign -> cont 47;
	TokenQuote -> cont 48;
	TokenInt happy_dollar_dollar -> cont 49;
	TokenWord happy_dollar_dollar -> cont 50;
	_ -> happyError' (tk:tks)
	}

happyError_ 51 tk tks = happyError' tks
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
parseError _ = error "Parse error"
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
