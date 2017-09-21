.class public final enum Lcom/example/tutorial/VideoProto$RoomType;
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
    name = "RoomType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/example/tutorial/VideoProto$RoomType;",
        ">;",
        "Lcom/google/protobuf/ProtocolMessageEnum;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/example/tutorial/VideoProto$RoomType;

.field public static final enum M_AUDIO_M_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

.field public static final M_AUDIO_M_VIDEO_ROOM_VALUE:I = 0x4

.field public static final enum M_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

.field public static final M_AUDIO_N_VIDEO_ROOM_VALUE:I = 0x3

.field public static final enum S_AUDIO_M_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

.field public static final S_AUDIO_M_VIDEO_ROOM_VALUE:I = 0x2

.field public static final enum S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

.field public static final S_AUDIO_N_VIDEO_ROOM_VALUE:I = 0x1

.field private static final VALUES:[Lcom/example/tutorial/VideoProto$RoomType;

.field private static internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$EnumLiteMap",
            "<",
            "Lcom/example/tutorial/VideoProto$RoomType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final index:I

.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x0

    const/4 v4, 0x3

    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 157
    new-instance v0, Lcom/example/tutorial/VideoProto$RoomType;

    const-string v1, "S_AUDIO_N_VIDEO_ROOM"

    .line 164
    invoke-direct {v0, v1, v5, v5, v2}, Lcom/example/tutorial/VideoProto$RoomType;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    .line 165
    new-instance v0, Lcom/example/tutorial/VideoProto$RoomType;

    const-string v1, "S_AUDIO_M_VIDEO_ROOM"

    .line 172
    invoke-direct {v0, v1, v2, v2, v3}, Lcom/example/tutorial/VideoProto$RoomType;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_M_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    .line 173
    new-instance v0, Lcom/example/tutorial/VideoProto$RoomType;

    const-string v1, "M_AUDIO_N_VIDEO_ROOM"

    .line 180
    invoke-direct {v0, v1, v3, v3, v4}, Lcom/example/tutorial/VideoProto$RoomType;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$RoomType;->M_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    .line 181
    new-instance v0, Lcom/example/tutorial/VideoProto$RoomType;

    const-string v1, "M_AUDIO_M_VIDEO_ROOM"

    .line 188
    invoke-direct {v0, v1, v4, v4, v6}, Lcom/example/tutorial/VideoProto$RoomType;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$RoomType;->M_AUDIO_M_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    new-array v0, v6, [Lcom/example/tutorial/VideoProto$RoomType;

    sget-object v1, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_M_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/example/tutorial/VideoProto$RoomType;->M_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/example/tutorial/VideoProto$RoomType;->M_AUDIO_M_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/example/tutorial/VideoProto$RoomType;->ENUM$VALUES:[Lcom/example/tutorial/VideoProto$RoomType;

    .line 243
    new-instance v0, Lcom/example/tutorial/VideoProto$RoomType$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$RoomType$1;-><init>()V

    .line 242
    sput-object v0, Lcom/example/tutorial/VideoProto$RoomType;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    .line 262
    invoke-static {}, Lcom/example/tutorial/VideoProto$RoomType;->values()[Lcom/example/tutorial/VideoProto$RoomType;

    move-result-object v0

    sput-object v0, Lcom/example/tutorial/VideoProto$RoomType;->VALUES:[Lcom/example/tutorial/VideoProto$RoomType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;III)V
    .locals 0
    .param p3, "index"    # I
    .param p4, "value"    # I

    .prologue
    .line 276
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 277
    iput p3, p0, Lcom/example/tutorial/VideoProto$RoomType;->index:I

    .line 278
    iput p4, p0, Lcom/example/tutorial/VideoProto$RoomType;->value:I

    .line 279
    return-void
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;
    .locals 2

    .prologue
    .line 259
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getEnumTypes()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x1

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
            "Lcom/example/tutorial/VideoProto$RoomType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 239
    sget-object v0, Lcom/example/tutorial/VideoProto$RoomType;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    return-object v0
.end method

.method public static valueOf(I)Lcom/example/tutorial/VideoProto$RoomType;
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 228
    packed-switch p0, :pswitch_data_0

    .line 233
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 229
    :pswitch_0
    sget-object v0, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    goto :goto_0

    .line 230
    :pswitch_1
    sget-object v0, Lcom/example/tutorial/VideoProto$RoomType;->S_AUDIO_M_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    goto :goto_0

    .line 231
    :pswitch_2
    sget-object v0, Lcom/example/tutorial/VideoProto$RoomType;->M_AUDIO_N_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    goto :goto_0

    .line 232
    :pswitch_3
    sget-object v0, Lcom/example/tutorial/VideoProto$RoomType;->M_AUDIO_M_VIDEO_ROOM:Lcom/example/tutorial/VideoProto$RoomType;

    goto :goto_0

    .line 228
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public static valueOf(Lcom/google/protobuf/Descriptors$EnumValueDescriptor;)Lcom/example/tutorial/VideoProto$RoomType;
    .locals 2
    .param p0, "desc"    # Lcom/google/protobuf/Descriptors$EnumValueDescriptor;

    .prologue
    .line 266
    invoke-virtual {p0}, Lcom/google/protobuf/Descriptors$EnumValueDescriptor;->getType()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v0

    invoke-static {}, Lcom/example/tutorial/VideoProto$RoomType;->getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 267
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 268
    const-string v1, "EnumValueDescriptor is not for this type."

    .line 267
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 270
    :cond_0
    sget-object v0, Lcom/example/tutorial/VideoProto$RoomType;->VALUES:[Lcom/example/tutorial/VideoProto$RoomType;

    invoke-virtual {p0}, Lcom/google/protobuf/Descriptors$EnumValueDescriptor;->getIndex()I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$RoomType;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/example/tutorial/VideoProto$RoomType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$RoomType;

    return-object v0
.end method

.method public static values()[Lcom/example/tutorial/VideoProto$RoomType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/example/tutorial/VideoProto$RoomType;->ENUM$VALUES:[Lcom/example/tutorial/VideoProto$RoomType;

    array-length v1, v0

    new-array v2, v1, [Lcom/example/tutorial/VideoProto$RoomType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public final getDescriptorForType()Lcom/google/protobuf/Descriptors$EnumDescriptor;
    .locals 1

    .prologue
    .line 255
    invoke-static {}, Lcom/example/tutorial/VideoProto$RoomType;->getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public final getNumber()I
    .locals 1

    .prologue
    .line 225
    iget v0, p0, Lcom/example/tutorial/VideoProto$RoomType;->value:I

    return v0
.end method

.method public final getValueDescriptor()Lcom/google/protobuf/Descriptors$EnumValueDescriptor;
    .locals 2

    .prologue
    .line 251
    invoke-static {}, Lcom/example/tutorial/VideoProto$RoomType;->getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$EnumDescriptor;->getValues()Ljava/util/List;

    move-result-object v0

    iget v1, p0, Lcom/example/tutorial/VideoProto$RoomType;->index:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$EnumValueDescriptor;

    return-object v0
.end method
