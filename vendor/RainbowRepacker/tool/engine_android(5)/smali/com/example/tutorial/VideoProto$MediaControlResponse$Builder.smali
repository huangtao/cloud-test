.class public final Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$MediaControlResponseOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$MediaControlResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$MediaControlResponseOrBuilder;"
    }
.end annotation


# instance fields
.field private bitField0_:I

.field private mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

.field private result_:Lcom/example/tutorial/VideoProto$ResultID;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 3224
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 3333
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 3369
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 3225
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->maybeForceBuilderInitialization()V

    .line 3226
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 3230
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 3333
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 3369
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 3231
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->maybeForceBuilderInitialization()V

    .line 3232
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;)V
    .locals 0

    .prologue
    .line 3228
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    .locals 1

    .prologue
    .line 3237
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->create()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    .locals 1

    .prologue
    .line 3238
    new-instance v0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 3213
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MediaControlResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$11()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 0

    .prologue
    .line 3234
    # getter for: Lcom/example/tutorial/VideoProto$MediaControlResponse;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->access$8()Z

    .line 3236
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$MediaControlResponse;
    .locals 2

    .prologue
    .line 3264
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$MediaControlResponse;

    move-result-object v0

    .line 3265
    .local v0, "result":Lcom/example/tutorial/VideoProto$MediaControlResponse;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 3266
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 3268
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->build()Lcom/example/tutorial/VideoProto$MediaControlResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->build()Lcom/example/tutorial/VideoProto$MediaControlResponse;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$MediaControlResponse;
    .locals 5

    .prologue
    .line 3272
    new-instance v1, Lcom/example/tutorial/VideoProto$MediaControlResponse;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$MediaControlResponse;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$MediaControlResponse;)V

    .line 3273
    .local v1, "result":Lcom/example/tutorial/VideoProto$MediaControlResponse;
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->bitField0_:I

    .line 3274
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 3275
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 3276
    or-int/lit8 v2, v2, 0x1

    .line 3278
    :cond_0
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->access$10(Lcom/example/tutorial/VideoProto$MediaControlResponse;Lcom/example/tutorial/VideoProto$ResultID;)V

    .line 3279
    and-int/lit8 v3, v0, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 3280
    or-int/lit8 v2, v2, 0x2

    .line 3282
    :cond_1
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->access$11(Lcom/example/tutorial/VideoProto$MediaControlResponse;Lcom/example/tutorial/VideoProto$MediaControl;)V

    .line 3283
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->access$12(Lcom/example/tutorial/VideoProto$MediaControlResponse;I)V

    .line 3284
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->onBuilt()V

    .line 3285
    return-object v1
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$MediaControlResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$MediaControlResponse;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    .locals 1

    .prologue
    .line 3242
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 3243
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 3244
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->bitField0_:I

    .line 3245
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 3246
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->bitField0_:I

    .line 3247
    return-object p0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->clear()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->clear()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->clear()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearMediaControl()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    .locals 1

    .prologue
    .line 3398
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->bitField0_:I

    .line 3399
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 3400
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->onChanged()V

    .line 3401
    return-object p0
.end method

.method public clearResult()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    .locals 1

    .prologue
    .line 3362
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->bitField0_:I

    .line 3363
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 3364
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->onChanged()V

    .line 3365
    return-object p0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    .locals 2

    .prologue
    .line 3251
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->create()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$MediaControlResponse;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MediaControlResponse;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->clone()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->clone()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->clone()Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MediaControlResponse;
    .locals 1

    .prologue
    .line 3260
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->getDefaultInstance()Lcom/example/tutorial/VideoProto$MediaControlResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MediaControlResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MediaControlResponse;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 3256
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MediaControlResponse_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$11()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getMediaControl()Lcom/example/tutorial/VideoProto$MediaControl;
    .locals 1

    .prologue
    .line 3380
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    return-object v0
.end method

.method public getResult()Lcom/example/tutorial/VideoProto$ResultID;
    .locals 1

    .prologue
    .line 3344
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    return-object v0
.end method

.method public hasMediaControl()Z
    .locals 2

    .prologue
    .line 3374
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->bitField0_:I

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

    .line 3338
    iget v1, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->bitField0_:I

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
    .line 3218
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MediaControlResponse_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$91()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 3220
    const-class v1, Lcom/example/tutorial/VideoProto$MediaControlResponse;

    const-class v2, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    .line 3219
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 3218
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 3310
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$MediaControlResponse;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$MediaControlResponse;

    .prologue
    .line 3298
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->getDefaultInstance()Lcom/example/tutorial/VideoProto$MediaControlResponse;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 3306
    :goto_0
    return-object p0

    .line 3299
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->hasResult()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3300
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->getResult()Lcom/example/tutorial/VideoProto$ResultID;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->setResult(Lcom/example/tutorial/VideoProto$ResultID;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    .line 3302
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->hasMediaControl()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3303
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->getMediaControl()Lcom/example/tutorial/VideoProto$MediaControl;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->setMediaControl(Lcom/example/tutorial/VideoProto$MediaControl;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    .line 3305
    :cond_2
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MediaControlResponse;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3317
    const/4 v2, 0x0

    .line 3319
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$MediaControlResponse;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$MediaControlResponse;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3324
    if-eqz v2, :cond_0

    .line 3325
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MediaControlResponse;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    .line 3328
    :cond_0
    return-object p0

    .line 3320
    :catch_0
    move-exception v1

    .line 3321
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlResponse;

    move-object v2, v0

    .line 3322
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3323
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 3324
    if-eqz v2, :cond_1

    .line 3325
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MediaControlResponse;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    .line 3327
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 3289
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$MediaControlResponse;

    if-eqz v0, :cond_0

    .line 3290
    check-cast p1, Lcom/example/tutorial/VideoProto$MediaControlResponse;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MediaControlResponse;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object p0

    .line 3293
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    :goto_0
    return-object p0

    .line 3292
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setMediaControl(Lcom/example/tutorial/VideoProto$MediaControl;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$MediaControl;

    .prologue
    .line 3386
    if-nez p1, :cond_0

    .line 3387
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 3389
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->bitField0_:I

    .line 3390
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 3391
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->onChanged()V

    .line 3392
    return-object p0
.end method

.method public setResult(Lcom/example/tutorial/VideoProto$ResultID;)Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$ResultID;

    .prologue
    .line 3350
    if-nez p1, :cond_0

    .line 3351
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 3353
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->bitField0_:I

    .line 3354
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->result_:Lcom/example/tutorial/VideoProto$ResultID;

    .line 3355
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlResponse$Builder;->onChanged()V

    .line 3356
    return-object p0
.end method
