.class public final enum Lcom/example/tutorial/VideoProto$ResultID;
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
    name = "ResultID"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/example/tutorial/VideoProto$ResultID;",
        ">;",
        "Lcom/google/protobuf/ProtocolMessageEnum;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/example/tutorial/VideoProto$ResultID;

.field public static final enum RESULT_OTHRE_PICKING_UP_MIC:Lcom/example/tutorial/VideoProto$ResultID;

.field public static final RESULT_OTHRE_PICKING_UP_MIC_VALUE:I = 0x3

.field public static final enum RESULT_ROOM_FULL:Lcom/example/tutorial/VideoProto$ResultID;

.field public static final RESULT_ROOM_FULL_VALUE:I = 0x1

.field public static final enum RESULT_ROOM_TYPE_NOT_MATCH:Lcom/example/tutorial/VideoProto$ResultID;

.field public static final RESULT_ROOM_TYPE_NOT_MATCH_VALUE:I = 0x4

.field public static final enum RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

.field public static final RESULT_SUCCESS_VALUE:I = 0x0

.field public static final enum RESULT_SYSTEM_BUSY:Lcom/example/tutorial/VideoProto$ResultID;

.field public static final RESULT_SYSTEM_BUSY_VALUE:I = 0x2

.field private static final VALUES:[Lcom/example/tutorial/VideoProto$ResultID;

.field private static internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$EnumLiteMap",
            "<",
            "Lcom/example/tutorial/VideoProto$ResultID;",
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

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 16
    new-instance v0, Lcom/example/tutorial/VideoProto$ResultID;

    const-string v1, "RESULT_SUCCESS"

    .line 19
    invoke-direct {v0, v1, v2, v2, v2}, Lcom/example/tutorial/VideoProto$ResultID;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    .line 20
    new-instance v0, Lcom/example/tutorial/VideoProto$ResultID;

    const-string v1, "RESULT_ROOM_FULL"

    .line 27
    invoke-direct {v0, v1, v3, v3, v3}, Lcom/example/tutorial/VideoProto$ResultID;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_ROOM_FULL:Lcom/example/tutorial/VideoProto$ResultID;

    .line 28
    new-instance v0, Lcom/example/tutorial/VideoProto$ResultID;

    const-string v1, "RESULT_SYSTEM_BUSY"

    .line 35
    invoke-direct {v0, v1, v4, v4, v4}, Lcom/example/tutorial/VideoProto$ResultID;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SYSTEM_BUSY:Lcom/example/tutorial/VideoProto$ResultID;

    .line 36
    new-instance v0, Lcom/example/tutorial/VideoProto$ResultID;

    const-string v1, "RESULT_OTHRE_PICKING_UP_MIC"

    .line 43
    invoke-direct {v0, v1, v5, v5, v5}, Lcom/example/tutorial/VideoProto$ResultID;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_OTHRE_PICKING_UP_MIC:Lcom/example/tutorial/VideoProto$ResultID;

    .line 44
    new-instance v0, Lcom/example/tutorial/VideoProto$ResultID;

    const-string v1, "RESULT_ROOM_TYPE_NOT_MATCH"

    .line 51
    invoke-direct {v0, v1, v6, v6, v6}, Lcom/example/tutorial/VideoProto$ResultID;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_ROOM_TYPE_NOT_MATCH:Lcom/example/tutorial/VideoProto$ResultID;

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/example/tutorial/VideoProto$ResultID;

    sget-object v1, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    aput-object v1, v0, v2

    sget-object v1, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_ROOM_FULL:Lcom/example/tutorial/VideoProto$ResultID;

    aput-object v1, v0, v3

    sget-object v1, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SYSTEM_BUSY:Lcom/example/tutorial/VideoProto$ResultID;

    aput-object v1, v0, v4

    sget-object v1, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_OTHRE_PICKING_UP_MIC:Lcom/example/tutorial/VideoProto$ResultID;

    aput-object v1, v0, v5

    sget-object v1, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_ROOM_TYPE_NOT_MATCH:Lcom/example/tutorial/VideoProto$ResultID;

    aput-object v1, v0, v6

    sput-object v0, Lcom/example/tutorial/VideoProto$ResultID;->ENUM$VALUES:[Lcom/example/tutorial/VideoProto$ResultID;

    .line 111
    new-instance v0, Lcom/example/tutorial/VideoProto$ResultID$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$ResultID$1;-><init>()V

    .line 110
    sput-object v0, Lcom/example/tutorial/VideoProto$ResultID;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    .line 130
    invoke-static {}, Lcom/example/tutorial/VideoProto$ResultID;->values()[Lcom/example/tutorial/VideoProto$ResultID;

    move-result-object v0

    sput-object v0, Lcom/example/tutorial/VideoProto$ResultID;->VALUES:[Lcom/example/tutorial/VideoProto$ResultID;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;III)V
    .locals 0
    .param p3, "index"    # I
    .param p4, "value"    # I

    .prologue
    .line 144
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 145
    iput p3, p0, Lcom/example/tutorial/VideoProto$ResultID;->index:I

    .line 146
    iput p4, p0, Lcom/example/tutorial/VideoProto$ResultID;->value:I

    .line 147
    return-void
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;
    .locals 2

    .prologue
    .line 127
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getEnumTypes()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

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
            "Lcom/example/tutorial/VideoProto$ResultID;",
            ">;"
        }
    .end annotation

    .prologue
    .line 107
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    return-object v0
.end method

.method public static valueOf(I)Lcom/example/tutorial/VideoProto$ResultID;
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 95
    packed-switch p0, :pswitch_data_0

    .line 101
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 96
    :pswitch_0
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SUCCESS:Lcom/example/tutorial/VideoProto$ResultID;

    goto :goto_0

    .line 97
    :pswitch_1
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_ROOM_FULL:Lcom/example/tutorial/VideoProto$ResultID;

    goto :goto_0

    .line 98
    :pswitch_2
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_SYSTEM_BUSY:Lcom/example/tutorial/VideoProto$ResultID;

    goto :goto_0

    .line 99
    :pswitch_3
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_OTHRE_PICKING_UP_MIC:Lcom/example/tutorial/VideoProto$ResultID;

    goto :goto_0

    .line 100
    :pswitch_4
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->RESULT_ROOM_TYPE_NOT_MATCH:Lcom/example/tutorial/VideoProto$ResultID;

    goto :goto_0

    .line 95
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public static valueOf(Lcom/google/protobuf/Descriptors$EnumValueDescriptor;)Lcom/example/tutorial/VideoProto$ResultID;
    .locals 2
    .param p0, "desc"    # Lcom/google/protobuf/Descriptors$EnumValueDescriptor;

    .prologue
    .line 134
    invoke-virtual {p0}, Lcom/google/protobuf/Descriptors$EnumValueDescriptor;->getType()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v0

    invoke-static {}, Lcom/example/tutorial/VideoProto$ResultID;->getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 135
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 136
    const-string v1, "EnumValueDescriptor is not for this type."

    .line 135
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 138
    :cond_0
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->VALUES:[Lcom/example/tutorial/VideoProto$ResultID;

    invoke-virtual {p0}, Lcom/google/protobuf/Descriptors$EnumValueDescriptor;->getIndex()I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$ResultID;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/example/tutorial/VideoProto$ResultID;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$ResultID;

    return-object v0
.end method

.method public static values()[Lcom/example/tutorial/VideoProto$ResultID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/example/tutorial/VideoProto$ResultID;->ENUM$VALUES:[Lcom/example/tutorial/VideoProto$ResultID;

    array-length v1, v0

    new-array v2, v1, [Lcom/example/tutorial/VideoProto$ResultID;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public final getDescriptorForType()Lcom/google/protobuf/Descriptors$EnumDescriptor;
    .locals 1

    .prologue
    .line 123
    invoke-static {}, Lcom/example/tutorial/VideoProto$ResultID;->getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public final getNumber()I
    .locals 1

    .prologue
    .line 92
    iget v0, p0, Lcom/example/tutorial/VideoProto$ResultID;->value:I

    return v0
.end method

.method public final getValueDescriptor()Lcom/google/protobuf/Descriptors$EnumValueDescriptor;
    .locals 2

    .prologue
    .line 119
    invoke-static {}, Lcom/example/tutorial/VideoProto$ResultID;->getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$EnumDescriptor;->getValues()Ljava/util/List;

    move-result-object v0

    iget v1, p0, Lcom/example/tutorial/VideoProto$ResultID;->index:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$EnumValueDescriptor;

    return-object v0
.end method
