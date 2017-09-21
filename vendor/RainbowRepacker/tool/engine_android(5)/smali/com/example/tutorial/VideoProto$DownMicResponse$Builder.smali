.class public final Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$DownMicResponseOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$DownMicResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$DownMicResponseOrBuilder;"
    }
.end annotation


# instance fields
.field private bitField0_:I

.field private result_:Lcom/example/tutorial/VideoProto$ResultID;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 14975
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 15075
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 14976
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->maybeForceBuilderInitialization()V

    .line 14977
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 14981
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 15075
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 14982
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->maybeForceBuilderInitialization()V

    .line 14983
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;)V
    .locals 0

    .prologue
    .line 14979
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
    .locals 1

    .prologue
    .line 14988
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->create()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
    .locals 1

    .prologue
    .line 14989
    new-instance v0, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 14964
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_DownMicResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$53()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 0

    .prologue
    .line 14985
    # getter for: Lcom/example/tutorial/VideoProto$DownMicResponse;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicResponse;->access$8()Z

    .line 14987
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$DownMicResponse;
    .locals 2

    .prologue
    .line 15013
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$DownMicResponse;

    move-result-object v0

    .line 15014
    .local v0, "result":Lcom/example/tutorial/VideoProto$DownMicResponse;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$DownMicResponse;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 15015
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 15017
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->build()Lcom/example/tutorial/VideoProto$DownMicResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->build()Lcom/example/tutorial/VideoProto$DownMicResponse;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$DownMicResponse;
    .locals 5

    .prologue
    .line 15021
    new-instance v1, Lcom/example/tutorial/VideoProto$DownMicResponse;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$DownMicResponse;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$DownMicResponse;)V

    .line 15022
    .local v1, "result":Lcom/example/tutorial/VideoProto$DownMicResponse;
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->bitField0_:I

    .line 15023
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 15024
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 15025
    or-int/lit8 v2, v2, 0x1

    .line 15027
    :cond_0
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$DownMicResponse;->access$10(Lcom/example/tutorial/VideoProto$DownMicResponse;Lcom/example/tutorial/VideoProto$ResultID;)V

    .line 15028
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$DownMicResponse;->access$11(Lcom/example/tutorial/VideoProto$DownMicResponse;I)V

    .line 15029
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->onBuilt()V

    .line 15030
    return-object v1
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$DownMicResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$DownMicResponse;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
    .locals 1

    .prologue
    .line 14993
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 14994
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 14995
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->bitField0_:I

    .line 14996
    return-object p0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->clear()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->clear()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->clear()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearResult()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
    .locals 1

    .prologue
    .line 15104
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->bitField0_:I

    .line 15105
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 15106
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->onChanged()V

    .line 15107
    return-object p0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
    .locals 2

    .prologue
    .line 15000
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->create()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$DownMicResponse;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$DownMicResponse;)Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->clone()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->clone()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->clone()Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$DownMicResponse;
    .locals 1

    .prologue
    .line 15009
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicResponse;->getDefaultInstance()Lcom/example/tutorial/VideoProto$DownMicResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$DownMicResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$DownMicResponse;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 15005
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_DownMicResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$53()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getResult()Lcom/example/tutorial/VideoProto$ResultID;
    .locals 1

    .prologue
    .line 15086
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    return-object v0
.end method

.method public hasResult()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 15080
    iget v1, p0, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->bitField0_:I

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
    .line 14969
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_DownMicResponse_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$105()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 14971
    const-class v1, Lcom/example/tutorial/VideoProto$DownMicResponse;

    const-class v2, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    .line 14970
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 14969
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 15052
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$DownMicResponse;)Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$DownMicResponse;

    .prologue
    .line 15043
    invoke-static {}, Lcom/example/tutorial/VideoProto$DownMicResponse;->getDefaultInstance()Lcom/example/tutorial/VideoProto$DownMicResponse;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 15048
    :goto_0
    return-object p0

    .line 15044
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$DownMicResponse;->hasResult()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 15045
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$DownMicResponse;->getResult()Lcom/example/tutorial/VideoProto$ResultID;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->setResult(Lcom/example/tutorial/VideoProto$ResultID;)Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    .line 15047
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$DownMicResponse;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 15059
    const/4 v2, 0x0

    .line 15061
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$DownMicResponse;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$DownMicResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicResponse;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15066
    if-eqz v2, :cond_0

    .line 15067
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$DownMicResponse;)Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    .line 15070
    :cond_0
    return-object p0

    .line 15062
    :catch_0
    move-exception v1

    .line 15063
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$DownMicResponse;

    move-object v2, v0

    .line 15064
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15065
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 15066
    if-eqz v2, :cond_1

    .line 15067
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$DownMicResponse;)Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    .line 15069
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 15034
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$DownMicResponse;

    if-eqz v0, :cond_0

    .line 15035
    check-cast p1, Lcom/example/tutorial/VideoProto$DownMicResponse;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$DownMicResponse;)Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object p0

    .line 15038
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
    :goto_0
    return-object p0

    .line 15037
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setResult(Lcom/example/tutorial/VideoProto$ResultID;)Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$ResultID;

    .prologue
    .line 15092
    if-nez p1, :cond_0

    .line 15093
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 15095
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->bitField0_:I

    .line 15096
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 15097
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$DownMicResponse$Builder;->onChanged()V

    .line 15098
    return-object p0
.end method
