//
// Created by Karol on 27.07.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import "BinarySearchTreeObjC.h"
#import "Node.h"

@interface BinarySearchTreeObjC ()

@property (nonatomic, strong) Node *rootNode;

@end

@implementation BinarySearchTreeObjC

- (void)addElement:(NSInteger)element {
    if (self.rootNode != nil) {
        [self addElement:element toTreeRootedInNode:self.rootNode];
    } else {
        self.rootNode = [Node new];
        self.rootNode.element = element;
    }
}

- (void)addElement:(NSInteger)element toTreeRootedInNode:(Node *)node {
    if (node.element == element) {
        return;
    } else if (element < node.element) {
        if (node.left != nil) {
            [self addElement:element toTreeRootedInNode:node.left];
        } else {
            node.left = [Node new];
            node.left.element = element;
        }
    } else {
        if (node.right != nil) {
            [self addElement:element toTreeRootedInNode:node.right];
        } else {
            node.right = [Node new];
            node.right.element = element;
        }
    }
}

- (void)print {
    [self printNode:self.rootNode];
}

- (void)printNode:(Node *)node {
    if (node == nil) {
        return;
    } else {
        printf("<");
        [self printNode:node.left];
        printf("%li", node.element);
        [self printNode:node.right];
        printf(">");
    }
}

@end