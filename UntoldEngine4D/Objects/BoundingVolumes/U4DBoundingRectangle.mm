//
//  U4DBoundingRectangle.cpp
//  UntoldEngine
//
//  Created by Harold Serrano on 7/13/13.
//  Copyright (c) 2013 Untold Story Studio. All rights reserved.
//

#include "U4DBoundingRectangle.h"

void U4DBoundingRectangle::initRectangleGeometry(float uWidth,float uHeight,float uDepth){
    
    //make a rectangle
    float width=uWidth/2;
    float height=uHeight/2;
    float depth=uDepth/2;
    
    U4DVector3n v1(width,height,depth);
    U4DVector3n v2(width,height,-depth);
    U4DVector3n v3(-width,height,-depth);
    U4DVector3n v4(-width,height,depth);
    
    U4DVector3n v5(width,-height,depth);
    U4DVector3n v6(width,-height,-depth);
    U4DVector3n v7(-width,-height,-depth);
    U4DVector3n v8(-width,-height,depth);
    
    U4DIndex i1(0,1,2);
    U4DIndex i2(2,3,0);
    U4DIndex i3(4,5,6);
    U4DIndex i4(6,7,4);
    
    U4DIndex i5(5,6,2);
    U4DIndex i6(2,3,7);
    U4DIndex i7(7,4,5);
    U4DIndex i8(5,1,0);
    
    bodyCoordinates.addVerticesDataToContainer(v1);
    bodyCoordinates.addVerticesDataToContainer(v2);
    bodyCoordinates.addVerticesDataToContainer(v3);
    bodyCoordinates.addVerticesDataToContainer(v4);
    
    bodyCoordinates.addVerticesDataToContainer(v5);
    bodyCoordinates.addVerticesDataToContainer(v6);
    bodyCoordinates.addVerticesDataToContainer(v7);
    bodyCoordinates.addVerticesDataToContainer(v8);
    
    bodyCoordinates.addIndexDataToContainer(i1);
    bodyCoordinates.addIndexDataToContainer(i2);
    bodyCoordinates.addIndexDataToContainer(i3);
    bodyCoordinates.addIndexDataToContainer(i4);
    
    bodyCoordinates.addIndexDataToContainer(i5);
    bodyCoordinates.addIndexDataToContainer(i6);
    bodyCoordinates.addIndexDataToContainer(i7);
    bodyCoordinates.addIndexDataToContainer(i8);

    setGeometry();

}