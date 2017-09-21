.class public final enum Lcom/example/tutorial/VideoProto$FrameType;
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
    name = "FrameType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/example/tutorial/VideoProto$FrameType;",
        ">;",
        "Lcom/google/protobuf/ProtocolMessageEnum;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/example/tutorial/VideoProto$FrameType;

.field public static final enum FRAME_I:Lcom/example/tutorial/VideoProto$FrameType;

.field public static final FRAME_I_VALUE:I = 0x1

.field public static final enum FRAME_P:Lcom/example/tutorial/VideoProto$FrameType;

.field public static final FRAME_P_VALUE:I

.field private static final VALUES:[Lcom/example/tutorial/VideoProto$FrameType;

.field private static internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$EnumLiteMap",
            "<",
            "Lcom/example/tutorial/VideoProto$FrameType;",
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

    .line 670
    new-instance v0, Lcom/example/tutorial/VideoProto$FrameType;

    const-string v1, "FRAME_P"

    .line 677
    invoke-direct {v0, v1, v2, v2, v2}, Lcom/example/tutorial/VideoProto$FrameType;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_P:Lcom/example/tutorial/VideoProto$FrameType;

    .line 678
    new-instance v0, Lcom/example/tutorial/VideoProto$FrameType;

    const-string v1, "FRAME_I"

    .line 685
    invoke-direct {v0, v1, v3, v3, v3}, Lcom/example/tutorial/VideoProto$FrameType;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_I:Lcom/example/tutorial/VideoProto$FrameType;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/example/tutorial/VideoProto$FrameType;

    sget-object v1, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_P:Lcom/example/tutorial/VideoProto$FrameType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_I:Lcom/example/tutorial/VideoProto$FrameType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/example/tutorial/VideoProto$FrameType;->ENUM$VALUES:[Lcom/example/tutorial/VideoProto$FrameType;

    .line 722
    new-instance v0, Lcom/example/tutorial/VideoProto$FrameType$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$FrameType$1;-><init>()V

    .line 721
    sput-object v0, Lcom/example/tutorial/VideoProto$FrameType;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    .line 741
    invoke-static {}, Lcom/example/tutorial/VideoProto$FrameType;->values()[Lcom/example/tutorial/VideoProto$FrameType;

    move-result-object v0

    sput-object v0, Lcom/example/tutorial/VideoProto$FrameType;->VALUES:[Lcom/example/tutorial/VideoProto$FrameType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;III)V
    .locals 0
    .param p3, "index"    # I
    .param p4, "value"    # I

    .prologue
    .line 755
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 756
    iput p3, p0, Lcom/example/tutorial/VideoProto$FrameType;->index:I

    .line 757
    iput p4, p0, Lcom/example/tutorial/VideoProto$FrameType;->value:I

    .line 758
    return-void
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;
    .locals 2

    .prologue
    .line 738
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getEnumTypes()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x5

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
            "Lcom/example/tutorial/VideoProto$FrameType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 718
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameType;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    return-object v0
.end method

.method public static valueOf(I)Lcom/example/tutorial/VideoProto$FrameType;
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 709
    packed-switch p0, :pswitch_data_0

    .line 712
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 710
    :pswitch_0
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_P:Lcom/example/tutorial/VideoProto$FrameType;

    goto :goto_0

    .line 711
    :pswitch_1
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameType;->FRAME_I:Lcom/example/tutorial/VideoProto$FrameType;

    goto :goto_0

    .line 709
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static valueOf(Lcom/google/protobuf/Descriptors$EnumValueDescriptor;)Lcom/example/tutorial/VideoProto$FrameType;
    .locals 2
    .param p0, "desc"    # Lcom/google/protobuf/Descriptors$EnumValueDescriptor;

    .prologue
    .line 745
    invoke-virtual {p0}, Lcom/google/protobuf/Descriptors$EnumValueDescriptor;->getType()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v0

    invoke-static {}, Lcom/example/tutorial/VideoProto$FrameType;->getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 746
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 747
    const-string v1, "EnumValueDescriptor is not for this type."

    .line 746
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 749
    :cond_0
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameType;->VALUES:[Lcom/example/tutorial/VideoProto$FrameType;

    invoke-virtual {p0}, Lcom/google/protobuf/Descriptors$EnumValueDescriptor;->getIndex()I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$FrameType;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/example/tutorial/VideoProto$FrameType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$FrameType;

    return-object v0
.end method

.method public static values()[Lcom/example/tutorial/VideoProto$FrameType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/example/tutorial/VideoProto$FrameType;->ENUM$VALUES:[Lcom/example/tutorial/VideoProto$FrameType;

    array-length v1, v0

    new-array v2, v1, [Lcom/example/tutorial/VideoProto$FrameType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public final getDescriptorForType()Lcom/google/protobuf/Descriptors$EnumDescriptor;
    .locals 1

    .prologue
    .line 734
    invoke-static {}, Lcom/example/tutorial/VideoProto$FrameType;->getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public final getNumber()I
    .locals 1

    .prologue
    .line 706
    iget v0, p0, Lcom/example/tutorial/VideoProto$FrameType;->value:I

    return v0
.end method

.method public final getValueDescriptor()Lcom/google/protobuf/Descriptors$EnumValueDescriptor;
    .locals 2

    .prologue
    .line 730
    invoke-static {}, Lcom/example/tutorial/VideoProto$FrameType;->getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$EnumDescriptor;->getValues()Ljava/util/List;

    move-result-object v0

    iget v1, p0, Lcom/example/tutorial/VideoProto$FrameType;->index:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$EnumValueDescriptor;

    return-object v0
.end method
