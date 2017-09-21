.class public final Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
.super Lcom/google/protobuf/GeneratedMessage$Builder;
.source "VideoProto.java"

# interfaces
.implements Lcom/example/tutorial/VideoProto$MediaControlRequestOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto$MediaControlRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessage$Builder",
        "<",
        "Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;",
        ">;",
        "Lcom/example/tutorial/VideoProto$MediaControlRequestOrBuilder;"
    }
.end annotation


# instance fields
.field private bitField0_:I

.field private mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 2774
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>()V

    .line 2874
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 2775
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->maybeForceBuilderInitialization()V

    .line 2776
    return-void
.end method

.method private constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/protobuf/GeneratedMessage$BuilderParent;

    .prologue
    .line 2780
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessage$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    .line 2874
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 2781
    invoke-direct {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->maybeForceBuilderInitialization()V

    .line 2782
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;)V
    .locals 0

    .prologue
    .line 2778
    invoke-direct {p0, p1}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;-><init>(Lcom/google/protobuf/GeneratedMessage$BuilderParent;)V

    return-void
.end method

.method static synthetic access$17()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
    .locals 1

    .prologue
    .line 2787
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->create()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method private static create()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
    .locals 1

    .prologue
    .line 2788
    new-instance v0, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;-><init>()V

    return-object v0
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 2763
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MediaControlRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$8()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method private maybeForceBuilderInitialization()V
    .locals 0

    .prologue
    .line 2784
    # getter for: Lcom/example/tutorial/VideoProto$MediaControlRequest;->alwaysUseFieldBuilders:Z
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->access$8()Z

    .line 2786
    return-void
.end method


# virtual methods
.method public build()Lcom/example/tutorial/VideoProto$MediaControlRequest;
    .locals 2

    .prologue
    .line 2812
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$MediaControlRequest;

    move-result-object v0

    .line 2813
    .local v0, "result":Lcom/example/tutorial/VideoProto$MediaControlRequest;
    invoke-virtual {v0}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 2814
    invoke-static {v0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->newUninitializedMessageException(Lcom/google/protobuf/Message;)Lcom/google/protobuf/UninitializedMessageException;

    move-result-object v1

    throw v1

    .line 2816
    :cond_0
    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->build()Lcom/example/tutorial/VideoProto$MediaControlRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->build()Lcom/example/tutorial/VideoProto$MediaControlRequest;

    move-result-object v0

    return-object v0
.end method

.method public buildPartial()Lcom/example/tutorial/VideoProto$MediaControlRequest;
    .locals 5

    .prologue
    .line 2820
    new-instance v1, Lcom/example/tutorial/VideoProto$MediaControlRequest;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/example/tutorial/VideoProto$MediaControlRequest;-><init>(Lcom/google/protobuf/GeneratedMessage$Builder;Lcom/example/tutorial/VideoProto$MediaControlRequest;)V

    .line 2821
    .local v1, "result":Lcom/example/tutorial/VideoProto$MediaControlRequest;
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->bitField0_:I

    .line 2822
    .local v0, "from_bitField0_":I
    const/4 v2, 0x0

    .line 2823
    .local v2, "to_bitField0_":I
    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 2824
    or-int/lit8 v2, v2, 0x1

    .line 2826
    :cond_0
    iget-object v3, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    invoke-static {v1, v3}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->access$10(Lcom/example/tutorial/VideoProto$MediaControlRequest;Lcom/example/tutorial/VideoProto$MediaControl;)V

    .line 2827
    invoke-static {v1, v2}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->access$11(Lcom/example/tutorial/VideoProto$MediaControlRequest;I)V

    .line 2828
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->onBuilt()V

    .line 2829
    return-object v1
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$MediaControlRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildPartial()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$MediaControlRequest;

    move-result-object v0

    return-object v0
.end method

.method public clear()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
    .locals 1

    .prologue
    .line 2792
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessage$Builder;->clear()Lcom/google/protobuf/GeneratedMessage$Builder;

    .line 2793
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 2794
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->bitField0_:I

    .line 2795
    return-object p0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clear()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->clear()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearMediaControl()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
    .locals 1

    .prologue
    .line 2903
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->bitField0_:I

    .line 2904
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    iput-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 2905
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->onChanged()V

    .line 2906
    return-object p0
.end method

.method public clone()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
    .locals 2

    .prologue
    .line 2799
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->create()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->buildPartial()Lcom/example/tutorial/VideoProto$MediaControlRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MediaControlRequest;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/GeneratedMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/MessageLite$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->clone()Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MediaControlRequest;
    .locals 1

    .prologue
    .line 2808
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->getDefaultInstance()Lcom/example/tutorial/VideoProto$MediaControlRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/Message;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MediaControlRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/MessageLite;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->getDefaultInstanceForType()Lcom/example/tutorial/VideoProto$MediaControlRequest;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptorForType()Lcom/google/protobuf/Descriptors$Descriptor;
    .locals 1

    .prologue
    .line 2804
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MediaControlRequest_descriptor:Lcom/google/protobuf/Descriptors$Descriptor;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$8()Lcom/google/protobuf/Descriptors$Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getMediaControl()Lcom/example/tutorial/VideoProto$MediaControl;
    .locals 1

    .prologue
    .line 2885
    iget-object v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    return-object v0
.end method

.method public hasMediaControl()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 2879
    iget v1, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->bitField0_:I

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
    .line 2768
    # getter for: Lcom/example/tutorial/VideoProto;->internal_static_tutorial_MediaControlRequest_fieldAccessorTable:Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;
    invoke-static {}, Lcom/example/tutorial/VideoProto;->access$90()Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 2770
    const-class v1, Lcom/example/tutorial/VideoProto$MediaControlRequest;

    const-class v2, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    .line 2769
    invoke-virtual {v0, v1, v2}, Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;->ensureFieldAccessorsInitialized(Ljava/lang/Class;Ljava/lang/Class;)Lcom/google/protobuf/GeneratedMessage$FieldAccessorTable;

    move-result-object v0

    .line 2768
    return-object v0
.end method

.method public final isInitialized()Z
    .locals 1

    .prologue
    .line 2851
    const/4 v0, 0x1

    return v0
.end method

.method public mergeFrom(Lcom/example/tutorial/VideoProto$MediaControlRequest;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
    .locals 1
    .param p1, "other"    # Lcom/example/tutorial/VideoProto$MediaControlRequest;

    .prologue
    .line 2842
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->getDefaultInstance()Lcom/example/tutorial/VideoProto$MediaControlRequest;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 2847
    :goto_0
    return-object p0

    .line 2843
    :cond_0
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->hasMediaControl()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2844
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->getMediaControl()Lcom/example/tutorial/VideoProto$MediaControl;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->setMediaControl(Lcom/example/tutorial/VideoProto$MediaControl;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    .line 2846
    :cond_1
    invoke-virtual {p1}, Lcom/example/tutorial/VideoProto$MediaControlRequest;->getUnknownFields()Lcom/google/protobuf/UnknownFieldSet;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->mergeUnknownFields(Lcom/google/protobuf/UnknownFieldSet;)Lcom/google/protobuf/GeneratedMessage$Builder;

    goto :goto_0
.end method

.method public mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
    .locals 4
    .param p1, "input"    # Lcom/google/protobuf/CodedInputStream;
    .param p2, "extensionRegistry"    # Lcom/google/protobuf/ExtensionRegistryLite;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2858
    const/4 v2, 0x0

    .line 2860
    .local v2, "parsedMessage":Lcom/example/tutorial/VideoProto$MediaControlRequest;
    :try_start_0
    sget-object v3, Lcom/example/tutorial/VideoProto$MediaControlRequest;->PARSER:Lcom/google/protobuf/Parser;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/Parser;->parsePartialFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;

    move-object v2, v0
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2865
    if-eqz v2, :cond_0

    .line 2866
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MediaControlRequest;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    .line 2869
    :cond_0
    return-object p0

    .line 2861
    :catch_0
    move-exception v1

    .line 2862
    .local v1, "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :try_start_1
    invoke-virtual {v1}, Lcom/google/protobuf/InvalidProtocolBufferException;->getUnfinishedMessage()Lcom/google/protobuf/MessageLite;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControlRequest;

    move-object v2, v0

    .line 2863
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2864
    .end local v1    # "e":Lcom/google/protobuf/InvalidProtocolBufferException;
    :catchall_0
    move-exception v3

    .line 2865
    if-eqz v2, :cond_1

    .line 2866
    invoke-virtual {p0, v2}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MediaControlRequest;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    .line 2868
    :cond_1
    throw v3
.end method

.method public mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
    .locals 1
    .param p1, "other"    # Lcom/google/protobuf/Message;

    .prologue
    .line 2833
    instance-of v0, p1, Lcom/example/tutorial/VideoProto$MediaControlRequest;

    if-eqz v0, :cond_0

    .line 2834
    check-cast p1, Lcom/example/tutorial/VideoProto$MediaControlRequest;

    .end local p1    # "other":Lcom/google/protobuf/Message;
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->mergeFrom(Lcom/example/tutorial/VideoProto$MediaControlRequest;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object p0

    .line 2837
    .end local p0    # "this":Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
    :goto_0
    return-object p0

    .line 2836
    .restart local p0    # "this":Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/AbstractMessage$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/Message;)Lcom/google/protobuf/Message$Builder;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->mergeFrom(Lcom/google/protobuf/Message;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

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
    invoke-virtual {p0, p1, p2}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->mergeFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setMediaControl(Lcom/example/tutorial/VideoProto$MediaControl;)Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;
    .locals 1
    .param p1, "value"    # Lcom/example/tutorial/VideoProto$MediaControl;

    .prologue
    .line 2891
    if-nez p1, :cond_0

    .line 2892
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 2894
    :cond_0
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->bitField0_:I

    .line 2895
    iput-object p1, p0, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->mediaControl_:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 2896
    invoke-virtual {p0}, Lcom/example/tutorial/VideoProto$MediaControlRequest$Builder;->onChanged()V

    .line 2897
    return-object p0
.end method
