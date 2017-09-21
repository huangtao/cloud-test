.class public final Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$AudioCheckResponseOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$AudioCheckResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$AudioCheckResponseOrBuilder;"
    }
.end annotation


# instance fields
.field private bitField0_:I

.field private sendCheckNum_:I

.field private sendUserId_:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 20040
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 20041
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->maybeForceBuilderInitialization()V

    .line 20042
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 0
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 20046
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 20047
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->maybeForceBuilderInitialization()V

    .line 20048
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;)V
    .locals 0

    .prologue
    .line 20044
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    .locals 1

    .prologue
    .line 20053
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->create()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    .locals 1

    .prologue
    .line 20054
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 20029
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCheckResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$77()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 0

    .prologue
    .line 20050
    # getter for: Lcom/example/tutorial/VideoProto$AudioCheckResponse;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->access$8()Z

    .line 20052
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$AudioCheckResponse;
    .locals 2

    .prologue
    .line 20080
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    move-result-object v0

    .line 20081
    .local v0, "result":Lcom/example/tutorial/VideoProto$AudioCheckResponse;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 20082
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 20084
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->build()Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->build()Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$AudioCheckResponse;
    .locals 5

    .prologue
    .line 20088
    new-instance v1, Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$AudioCheckResponse;)V

    .line 20089
    .local v1, "result":Lcom/example/tutorial/VideoProto$AudioCheckResponse;
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->bitField0_:I

    .line 20090
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 20091
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 20092
    or-int/lit8 v2, v2, 0x1

    .line 20094
    :cond_0
    iget v3, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->sendUserId_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->access$10(Lcom/example/tutorial/VideoProto$AudioCheckResponse;I)V

    .line 20095
    and-int/lit8 v3, v0, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 20096
    or-int/lit8 v2, v2, 0x2

    .line 20098
    :cond_1
    iget v3, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->sendCheckNum_:I

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->access$11(Lcom/example/tutorial/VideoProto$AudioCheckResponse;I)V

    .line 20099
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->access$12(Lcom/example/tutorial/VideoProto$AudioCheckResponse;I)V

    .line 20100
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->onBuilt()V

    .line 20101
    return-object v1
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 20058
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 20059
    iput v1, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->sendUserId_:I

    .line 20060
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->bitField0_:I

    .line 20061
    iput v1, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->sendCheckNum_:I

    .line 20062
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->bitField0_:I

    .line 20063
    return-object p0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->clear()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->clear()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->clear()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearSendCheckNum()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    .locals 1

    .prologue
    .line 20240
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->bitField0_:I

    .line 20241
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->sendCheckNum_:I

    .line 20242
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->onChanged()V

    .line 20243
    return-object p0
.end method

.method public clearSendUserId()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    .locals 1

    .prologue
    .line 20191
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->bitField0_:I

    .line 20192
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->sendUserId_:I

    .line 20193
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->onChanged()V

    .line 20194
    return-object p0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    .locals 2

    .prologue
    .line 20067
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->create()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCheckResponse;)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->clone()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->clone()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->clone()Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCheckResponse;
    .locals 1

    .prologue
    .line 20076
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 20072
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCheckResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$77()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getSendCheckNum()I
    .locals 1

    .prologue
    .line 20217
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->sendCheckNum_:I

    return v0
.end method

.method public getSendUserId()I
    .locals 1

    .prologue
    .line 20168
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->sendUserId_:I

    return v0
.end method

.method public hasSendCheckNum()Z
    .locals 2

    .prologue
    .line 20207
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, 0x2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasSendUserId()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 20158
    iget v1, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->bitField0_:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected internalGetFieldAccessorTable()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    .locals 3

    .prologue
    .line 20034
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCheckResponse_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$113()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 20036
    const-class v1, Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    const-class v2, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    .line 20035
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 20034
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 20126
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$AudioCheckResponse;)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    .prologue
    .line 20114
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 20122
    :goto_0
    return-object p0

    .line 20115
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->hasSendUserId()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 20116
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->getSendUserId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->setSendUserId(I)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    .line 20118
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->hasSendCheckNum()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 20119
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->getSendCheckNum()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->setSendCheckNum(I)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    .line 20121
    :cond_2
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20133
    const/4 v2, 0x0

    .line 20135
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$AudioCheckResponse;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$AudioCheckResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20140
    if-eqz v2, :cond_0

    .line 20141
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCheckResponse;)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    .line 20144
    :cond_0
    return-object p0

    .line 20136
    :catch_0
    move-exception v1

    .line 20137
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    move-object v2, v0

    .line 20138
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20139
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 20140
    if-eqz v2, :cond_1

    .line 20141
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCheckResponse;)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    .line 20143
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 20105
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    if-eqz v0, :cond_0

    .line 20106
    check-cast p1, Lcom/example/tutorial/VideoProto$AudioCheckResponse;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCheckResponse;)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object p0

    .line 20109
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    :goto_0
    return-object p0

    .line 20108
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    .restart local p1    # "other":Lcom/google/protobuf/Message;
    :cond_0
    invoke-super {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;

    goto :goto_0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/Message$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/MessageLite$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setSendCheckNum(I)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 20227
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->bitField0_:I

    .line 20228
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->sendCheckNum_:I

    .line 20229
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->onChanged()V

    .line 20230
    return-object p0
.end method

.method public setSendUserId(I)Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 20178
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->bitField0_:I

    .line 20179
    iput p1, p0, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->sendUserId_:I

    .line 20180
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCheckResponse$Builder;->onChanged()V

    .line 20181
    return-object p0
.end method
