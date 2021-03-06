/**
 *  Info.m
 *  Mercury_iOS
 *
 *  Created by Julien Salvi on 9/12/11.
 *  Copyright 2011 Mogreet Inc. All rights reserved.
 *
 *  This file is part of Mercury.
 *
 *  Mercury is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  Mercury is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Mercury. If not, see <http://www.gnu.org/licenses/>. 
 */

#import "Info.h"

@implementation Info

- (void) initInfo:(NSString *)urlInfo {
	
	//Url for the Info call
	NSURL *url = [NSURL URLWithString:urlInfo];
	//Parsing the xmlDoc
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithContentsOfURL:url options:0 error:nil] autorelease];
	//Execution of Xpath
	NSArray *resNodeCode = [doc nodesForXPath:@"/response/@code" error:nil];
	NSArray *resNodeStatus = [doc nodesForXPath:@"/response/@status" error:nil];
	NSArray *resNodeMess = [doc nodesForXPath:@"/response/message" error:nil];
	NSArray *resNodeNum = [doc nodesForXPath:@"/response/number" error:nil];
	NSArray *resNodeCarr = [doc nodesForXPath:@"/response/carrier" error:nil];
	NSArray *resNodeCarrId = [doc nodesForXPath:@"/response/carrier/@id" error:nil];
	NSArray *resNodeHandset = [doc nodesForXPath:@"/response/handset" error:nil];
	NSArray *resNodeHandsetId = [doc nodesForXPath:@"/response/handset/@id" error:nil];
	
	CXMLElement *resElemCode = [resNodeCode objectAtIndex:0];
	CXMLElement *resElemStatus = [resNodeStatus objectAtIndex:0];
	CXMLElement *resElemMess = [resNodeMess objectAtIndex:0];
	CXMLElement *resElemNum = [resNodeNum objectAtIndex:0];
	CXMLElement *resElemCarr = [resNodeCarr objectAtIndex:0];
	CXMLElement *resElemCarrid = [resNodeCarrId objectAtIndex:0];
	CXMLElement *resElemHandset = [resNodeHandset objectAtIndex:0];
	CXMLElement *resElemHandsetid = [resNodeHandsetId objectAtIndex:0];
	
	NSString *mess = [resElemMess stringValue];
	NSString *status = [resElemStatus stringValue];
	NSString *code = [resElemCode stringValue];
	NSString *num = [resElemNum stringValue];
	NSString *carr = [resElemCarr stringValue];
	NSString *carrid = [resElemCarrid stringValue];
	NSString *hand = [resElemHandset stringValue];
	NSString *handid = [resElemHandsetid stringValue];
	
	self->message = mess;
	self->responseCode = [code intValue];
	self->responseStatus = status;
	self->number = num;
	self->carrier = carr;
	self->carrierId = [carrid intValue];
	self->handset = hand;
	self->handsetId = [handid intValue];
	
}

- (BOOL) responseIsValid {
	if (responseCode == 1) {
		return YES;
	} else {
		return NO;
	}
}

- (NSString*) getNumber {
	return self->number;
}

- (int) getCarrierId {
	return self->carrierId;
}

- (NSString*) getCarrier {
	return self->carrier;
}

- (int) getHandsetId {
	return self->handsetId;
}

- (NSString*) getHandset {
	return self->handset;
}

- (int) getResponseCode {
	return self->responseCode;
}

- (NSString*) getResponseStatus {
	return self->responseStatus;
}

- (NSString*) getMessage {
	return self->message;
}


@end
