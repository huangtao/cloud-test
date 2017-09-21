.class public final Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$AudioCtrolResponseOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$AudioCtrolResponseOrBuilder;"
    }
.end annotation


# instance fields
.field private bitField0_:I

.field private mediaControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

.field private result_:Lcom/example/tutorial/VideoProto$ResultID;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 20982
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 21091
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 21127
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 20983
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->maybeForceBuilderInitialization()V

    .line 20984
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 20988
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 21091
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 21127
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 20989
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->maybeForceBuilderInitialization()V

    .line 20990
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;)V
    .locals 0

    .prologue
    .line 20986
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    .locals 1

    .prologue
    .line 20995
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->create()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    .locals 1

    .prologue
    .line 20996
    new-instance v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 20971
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCtrolResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$83()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 0

    .prologue
    .line 20992
    # getter for: Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->access$8()Z

    .line 20994
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    .locals 2

    .prologue
    .line 21022
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    move-result-object v0

    .line 21023
    .local v0, "result":Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 21024
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 21026
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->build()Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->build()Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    .locals 5

    .prologue
    .line 21030
    new-instance v1, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$AudioCtrolResponse;)V

    .line 21031
    .local v1, "result":Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->bitField0_:I

    .line 21032
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 21033
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 21034
    or-int/lit8 v2, v2, 0x1

    .line 21036
    :cond_0
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->access$10(Lcom/example/tutorial/VideoProto$AudioCtrolResponse;Lcom/example/tutorial/VideoProto$ResultID;)V

    .line 21037
    and-int/lit8 v3, v0, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 21038
    or-int/lit8 v2, v2, 0x2

    .line 21040
    :cond_1
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->access$11(Lcom/example/tutorial/VideoProto$AudioCtrolResponse;Lcom/example/tutorial/VideoProto$AudioCtrol;)V

    .line 21041
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->access$12(Lcom/example/tutorial/VideoProto$AudioCtrolResponse;I)V

    .line 21042
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->onBuilt()V

    .line 21043
    return-object v1
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    .locals 1

    .prologue
    .line 21000
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 21001
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 21002
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->bitField0_:I

    .line 21003
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 21004
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->bitField0_:I

    .line 21005
    return-object p0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->clear()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->clear()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->clear()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearMediaControl()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    .locals 1

    .prologue
    .line 21156
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->bitField0_:I

    .line 21157
    sget-object v0, Lcom/example/tutorial/VideoProto$AudioCtrol;->AUDIO_SILENCE:Lcom/example/tutorial/VideoProto$AudioCtrol;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 21158
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->onChanged()V

    .line 21159
    return-object p0
.end method

.method public clearResult()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    .locals 1

    .prologue
    .line 21120
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->bitField0_:I

    .line 21121
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 21122
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->onChanged()V

    .line 21123
    return-object p0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    .locals 2

    .prologue
    .line 21009
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->create()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCtrolResponse;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->clone()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->clone()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->clone()Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    .locals 1

    .prologue
    .line 21018
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 21014
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCtrolResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$83()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getMediaControl()Lcom/example/tutorial/VideoProto$AudioCtrol;
    .locals 1

    .prologue
    .line 21138
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    return-object v0
.end method

.method public getResult()Lcom/example/tutorial/VideoProto$ResultID;
    .locals 1

    .prologue
    .line 21102
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    return-object v0
.end method

.method public hasMediaControl()Z
    .locals 2

    .prologue
    .line 21132
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->bitField0_:I

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

.method public hasResult()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 21096
    iget v1, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->bitField0_:I

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
    .line 20976
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_AudioCtrolResponse_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$115()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 20978
    const-class v1, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    const-class v2, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    .line 20977
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 20976
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 21068
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$AudioCtrolResponse;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    .prologue
    .line 21056
    invoke-static {}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->getDefaultInstance()Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 21064
    :goto_0
    return-object p0

    .line 21057
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->hasResult()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 21058
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->getResult()Lcom/example/tutorial/VideoProto$ResultID;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->setResult(Lcom/example/tutorial/VideoProto$ResultID;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    .line 21060
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->hasMediaControl()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 21061
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->getMediaControl()Lcom/example/tutorial/VideoProto$AudioCtrol;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->setMediaControl(Lcom/example/tutorial/VideoProto$AudioCtrol;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    .line 21063
    :cond_2
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 21075
    const/4 v2, 0x0

    .line 21077
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$AudioCtrolResponse;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21082
    if-eqz v2, :cond_0

    .line 21083
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCtrolResponse;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    .line 21086
    :cond_0
    return-object p0

    .line 21078
    :catch_0
    move-exception v1

    .line 21079
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    move-object v2, v0

    .line 21080
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21081
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 21082
    if-eqz v2, :cond_1

    .line 21083
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCtrolResponse;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    .line 21085
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 21047
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    if-eqz v0, :cond_0

    .line 21048
    check-cast p1, Lcom/example/tutorial/VideoProto$AudioCtrolResponse;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$AudioCtrolResponse;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object p0

    .line 21051
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    :goto_0
    return-object p0

    .line 21050
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setMediaControl(Lcom/example/tutorial/VideoProto$AudioCtrol;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$AudioCtrol;

    .prologue
    .line 21144
    if-nez p1, :cond_0

    .line 21145
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 21147
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->bitField0_:I

    .line 21148
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$AudioCtrol;

    .line 21149
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->onChanged()V

    .line 21150
    return-object p0
.end method

.method public setResult(Lcom/example/tutorial/VideoProto$ResultID;)Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$ResultID;

    .prologue
    .line 21108
    if-nez p1, :cond_0

    .line 21109
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 21111
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->bitField0_:I

    .line 21112
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 21113
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$AudioCtrolResponse$Builder;->onChanged()V

    .line 21114
    return-object p0
.end method
