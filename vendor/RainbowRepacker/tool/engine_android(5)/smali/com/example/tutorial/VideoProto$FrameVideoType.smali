.class public final enum Lcom/example/tutorial/VideoProto$FrameVideoType;
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
    name = "FrameVideoType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/example/tutorial/VideoProto$FrameVideoType;",
        ">;",
        "Lcom/google/protobuf/ProtocolMessageEnum;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/example/tutorial/VideoProto$FrameVideoType;

.field public static final enum FRAME_192:Lcom/example/tutorial/VideoProto$FrameVideoType;

.field public static final FRAME_192_VALUE:I = 0x0

.field public static final enum FRAME_320:Lcom/example/tutorial/VideoProto$FrameVideoType;

.field public static final FRAME_320_VALUE:I = 0x1

.field private static final VALUES:[Lcom/example/tutorial/VideoProto$FrameVideoType;

.field private static internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$EnumLiteMap",
            "<",
            "Lcom/example/tutorial/VideoProto$FrameVideoType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final index:I

.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 768
    new-instance v0, Lcom/example/tutorial/VideoProto$FrameVideoType;

    const-string v1, "FRAME_192"

    .line 775
    invoke-direct {v0, v1, v2, v2, v2}, Lcom/example/tutorial/VideoProto$FrameVideoType;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$FrameVideoType;->FRAME_192:Lcom/example/tutorial/VideoProto$FrameVideoType;

    .line 776
    new-instance v0, Lcom/example/tutorial/VideoProto$FrameVideoType;

    const-string v1, "FRAME_320"

    .line 783
    invoke-direct {v0, v1, v3, v3, v3}, Lcom/example/tutorial/VideoProto$FrameVideoType;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$FrameVideoType;->FRAME_320:Lcom/example/tutorial/VideoProto$FrameVideoType;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/example/tutorial/VideoProto$FrameVideoType;

    sget-object v1, Lcom/example/tutorial/VideoProto$FrameVideoType;->FRAME_192:Lcom/example/tutorial/VideoProto$FrameVideoType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/example/tutorial/VideoProto$FrameVideoType;->FRAME_320:Lcom/example/tutorial/VideoProto$FrameVideoType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/example/tutorial/VideoProto$FrameVideoType;->ENUM$VALUES:[Lcom/example/tutorial/VideoProto$FrameVideoType;

    .line 820
    new-instance v0, Lcom/example/tutorial/VideoProto$FrameVideoType$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$FrameVideoType$1;-><init>()V

    .line 819
    sput-object v0, Lcom/example/tutorial/VideoProto$FrameVideoType;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    .line 839
    invoke-static {}, Lcom/example/tutorial/VideoProto$FrameVideoType;->values()[Lcom/example/tutorial/VideoProto$FrameVideoType;

    move-result-object v0

    sput-object v0, Lcom/example/tutorial/VideoProto$FrameVideoType;->VALUES:[Lcom/example/tutorial/VideoProto$FrameVideoType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;III)V
    .locals 0
    .param p3, "index"    # I
    .param p4, "value"    # I

    .prologue
    .line 853
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 854
    iput p3, p0, Lcom/example/tutorial/VideoProto$FrameVideoType;->index:I

    .line 855
    iput p4, p0, Lcom/example/tutorial/VideoProto$FrameVideoType;->value:I

    .line 856
    return-void
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;
    .locals 2

    .prologue
    .line 836
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getEnumTypes()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x6

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
            "Lcom/example/tutorial/VideoProto$FrameVideoType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 816
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameVideoType;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    return-object v0
.end method

.method public static valueOf(I)Lcom/example/tutorial/VideoProto$FrameVideoType;
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 807
    packed-switch p0, :pswitch_data_0

    .line 810
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 808
    :pswitch_0
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameVideoType;->FRAME_192:Lcom/example/tutorial/VideoProto$FrameVideoType;

    goto :goto_0

    .line 809
    :pswitch_1
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameVideoType;->FRAME_320:Lcom/example/tutorial/VideoProto$FrameVideoType;

    goto :goto_0

    .line 807
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static valueOf(Lcom/google/protobuf/Descriptors$EnumValueDescriptor;)Lcom/example/tutorial/VideoProto$FrameVideoType;
    .locals 2
    .param p0, "desc"    # Lcom/google/protobuf/Descriptors$EnumValueDescriptor;

    .prologue
    .line 843
    invoke-virtual {p0}, Lcom/google/protobuf/Descriptors$EnumValueDescriptor;->getType()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v0

    invoke-static {}, Lcom/example/tutorial/VideoProto$FrameVideoType;->getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 844
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 845
    const-string v1, "EnumValueDescriptor is not for this type."

    .line 844
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 847
    :cond_0
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameVideoType;->VALUES:[Lcom/example/tutorial/VideoProto$FrameVideoType;

    invoke-virtual {p0}, Lcom/google/protobuf/Descriptors$EnumValueDescriptor;->getIndex()I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$FrameVideoType;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/example/tutorial/VideoProto$FrameVideoType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$FrameVideoType;

    return-object v0
.end method

.method public static values()[Lcom/example/tutorial/VideoProto$FrameVideoType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameVideoType;->ENUM$VALUES:[Lcom/example/tutorial/VideoProto$FrameVideoType;

    array-length v1, v0

    new-array v2, v1, [Lcom/example/tutorial/VideoProto$FrameVideoType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public final getDescriptorForType()Lcom/google/protobuf/Descriptors$EnumDescriptor;
    .locals 1

    .prologue
    .line 832
    invoke-static {}, Lcom/example/tutorial/VideoProto$FrameVideoType;->getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public final getNumber()I
    .locals 1

    .prologue
    .line 804
    iget v0, p0, Lcom/example/tutorial/VideoProto$FrameVideoType;->value:I

    return v0
.end method

.method public final getValueDescriptor()Lcom/google/protobuf/Descriptors$EnumValueDescriptor;
    .locals 2

    .prologue
    .line 828
    invoke-static {}, Lcom/example/tutorial/VideoProto$FrameVideoType;->getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$EnumDescriptor;->getValues()Ljava/util/List;

    move-result-object v0

    iget v1, p0, Lcom/example/tutorial/VideoProto$FrameVideoType;->index:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$EnumValueDescriptor;

    return-object v0
.end method
