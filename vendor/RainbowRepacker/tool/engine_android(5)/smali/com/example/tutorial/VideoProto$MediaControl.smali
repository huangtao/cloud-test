.class public final enum Lcom/example/tutorial/VideoProto$MediaControl;
.super Ljava/lang/Enum;
.source "VideoProto.java"

# interfaces
.implements Lcom/google/protobuf/ProtocolMessageEnum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/tutorial/VideoProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MediaControl"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/example/tutorial/VideoProto$MediaControl;",
        ">;",
        "Lcom/google/protobuf/ProtocolMessageEnum;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/example/tutorial/VideoProto$MediaControl;

.field public static final enum OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

.field public static final OPEN_AUDIO_VALUE:I = 0x0

.field public static final enum OPEN_VIDEO:Lcom/example/tutorial/VideoProto$MediaControl;

.field public static final OPEN_VIDEO_VALUE:I = 0x2

.field public static final enum SHUTDOWN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

.field public static final SHUTDOWN_AUDIO_VALUE:I = 0x1

.field public static final enum SHUTDOWN_VIDEO:Lcom/example/tutorial/VideoProto$MediaControl;

.field public static final SHUTDOWN_VIDEO_VALUE:I = 0x3

.field private static final VALUES:[Lcom/example/tutorial/VideoProto$MediaControl;

.field private static internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$EnumLiteMap",
            "<",
            "Lcom/example/tutorial/VideoProto$MediaControl;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final index:I

.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 438
    new-instance v0, Lcom/example/tutorial/VideoProto$MediaControl;

    const-string v1, "OPEN_AUDIO"

    .line 445
    invoke-direct {v0, v1, v2, v2, v2}, Lcom/example/tutorial/VideoProto$MediaControl;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 446
    new-instance v0, Lcom/example/tutorial/VideoProto$MediaControl;

    const-string v1, "SHUTDOWN_AUDIO"

    .line 453
    invoke-direct {v0, v1, v3, v3, v3}, Lcom/example/tutorial/VideoProto$MediaControl;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->SHUTDOWN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 454
    new-instance v0, Lcom/example/tutorial/VideoProto$MediaControl;

    const-string v1, "OPEN_VIDEO"

    .line 461
    invoke-direct {v0, v1, v4, v4, v4}, Lcom/example/tutorial/VideoProto$MediaControl;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_VIDEO:Lcom/example/tutorial/VideoProto$MediaControl;

    .line 462
    new-instance v0, Lcom/example/tutorial/VideoProto$MediaControl;

    const-string v1, "SHUTDOWN_VIDEO"

    .line 469
    invoke-direct {v0, v1, v5, v5, v5}, Lcom/example/tutorial/VideoProto$MediaControl;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->SHUTDOWN_VIDEO:Lcom/example/tutorial/VideoProto$MediaControl;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/example/tutorial/VideoProto$MediaControl;

    sget-object v1, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    aput-object v1, v0, v2

    sget-object v1, Lcom/example/tutorial/VideoProto$MediaControl;->SHUTDOWN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    aput-object v1, v0, v3

    sget-object v1, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_VIDEO:Lcom/example/tutorial/VideoProto$MediaControl;

    aput-object v1, v0, v4

    sget-object v1, Lcom/example/tutorial/VideoProto$MediaControl;->SHUTDOWN_VIDEO:Lcom/example/tutorial/VideoProto$MediaControl;

    aput-object v1, v0, v5

    sput-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->ENUM$VALUES:[Lcom/example/tutorial/VideoProto$MediaControl;

    .line 524
    new-instance v0, Lcom/example/tutorial/VideoProto$MediaControl$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$MediaControl$1;-><init>()V

    .line 523
    sput-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    .line 543
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControl;->values()[Lcom/example/tutorial/VideoProto$MediaControl;

    move-result-object v0

    sput-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->VALUES:[Lcom/example/tutorial/VideoProto$MediaControl;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;III)V
    .locals 0
    .param p3, "index"    # I
    .param p4, "value"    # I

    .prologue
    .line 557
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 558
    iput p3, p0, Lcom/example/tutorial/VideoProto$MediaControl;->index:I

    .line 559
    iput p4, p0, Lcom/example/tutorial/VideoProto$MediaControl;->value:I

    .line 560
    return-void
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;
    .locals 2

    .prologue
    .line 540
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getEnumTypes()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$EnumDescriptor;

    return-object v0
.end method

.method public static internalGetValueMap()Lcom/google/protobuf/Internal$EnumLiteMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Internal$EnumLiteMap",
            "<",
            "Lcom/example/tutorial/VideoProto$MediaControl;",
            ">;"
        }
    .end annotation

    .prologue
    .line 520
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    return-object v0
.end method

.method public static valueOf(I)Lcom/example/tutorial/VideoProto$MediaControl;
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 509
    packed-switch p0, :pswitch_data_0

    .line 514
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 510
    :pswitch_0
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    goto :goto_0

    .line 511
    :pswitch_1
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->SHUTDOWN_AUDIO:Lcom/example/tutorial/VideoProto$MediaControl;

    goto :goto_0

    .line 512
    :pswitch_2
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->OPEN_VIDEO:Lcom/example/tutorial/VideoProto$MediaControl;

    goto :goto_0

    .line 513
    :pswitch_3
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->SHUTDOWN_VIDEO:Lcom/example/tutorial/VideoProto$MediaControl;

    goto :goto_0

    .line 509
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public static valueOf(Lcom/google/protobuf/Descriptors$EnumValueDescriptor;)Lcom/example/tutorial/VideoProto$MediaControl;
    .locals 2
    .param p0, "desc"    # Lcom/google/protobuf/Descriptors$EnumValueDescriptor;

    .prologue
    .line 547
    invoke-virtual {p0}, Lcom/google/protobuf/Descriptors$EnumValueDescriptor;->getType()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v0

    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControl;->getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 548
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 549
    const-string v1, "EnumValueDescriptor is not for this type."

    .line 548
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 551
    :cond_0
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->VALUES:[Lcom/example/tutorial/VideoProto$MediaControl;

    invoke-virtual {p0}, Lcom/google/protobuf/Descriptors$EnumValueDescriptor;->getIndex()I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$MediaControl;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/example/tutorial/VideoProto$MediaControl;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$MediaControl;

    return-object v0
.end method

.method public static values()[Lcom/example/tutorial/VideoProto$MediaControl;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/example/tutorial/VideoProto$MediaControl;->ENUM$VALUES:[Lcom/example/tutorial/VideoProto$MediaControl;

    array-length v1, v0

    new-array v2, v1, [Lcom/example/tutorial/VideoProto$MediaControl;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public final getDescriptorForType()Lcom/google/protobuf/Descriptors$EnumDescriptor;
    .locals 1

    .prologue
    .line 536
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControl;->getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public final getNumber()I
    .locals 1

    .prologue
    .line 506
    iget v0, p0, Lcom/example/tutorial/VideoProto$MediaControl;->value:I

    return v0
.end method

.method public final getValueDescriptor()Lcom/google/protobuf/Descriptors$EnumValueDescriptor;
    .locals 2

    .prologue
    .line 532
    invoke-static {}, Lcom/example/tutorial/VideoProto$MediaControl;->getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$EnumDescriptor;->getValues()Ljava/util/List;

    move-result-object v0

    iget v1, p0, Lcom/example/tutorial/VideoProto$MediaControl;->index:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$EnumValueDescriptor;

    return-object v0
.end method
