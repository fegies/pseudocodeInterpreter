#pragma once
/* This is a node in the graph that the compiler compiles to
And that can be executed.
*/

typedef struct GraphNode GraphNode;

#define NODECONT char type; \
GraphNode* next;

struct GraphNode {
	NODECONT
};

typedef struct ConditionalNode {
	NODECONT
	GraphNode* nextFalse;
} ConditionalNode;

typedef struct lookupNode {
	NODECONT
	char* name;
}

typedef struct assignNode {
	NODECONT
	char * toName;
};

#undef NODECONT
