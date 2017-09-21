.class public final enum Lcom/example/tutorial/VideoProto$NetworkType;
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
    name = "NetworkType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/example/tutorial/VideoProto$NetworkType;",
        ">;",
        "Lcom/google/protobuf/ProtocolMessageEnum;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/example/tutorial/VideoProto$NetworkType;

.field public static final enum NETWORK_TYPE_2G:Lcom/example/tutorial/VideoProto$NetworkType;

.field public static final NETWORK_TYPE_2G_VALUE:I = 0x2

.field public static final enum NETWORK_TYPE_3G:Lcom/example/tutorial/VideoProto$NetworkType;

.field public static final NETWORK_TYPE_3G_VALUE:I = 0x3

.field public static final enum NETWORK_TYPE_4G:Lcom/example/tutorial/VideoProto$NetworkType;

.field public static final NETWORK_TYPE_4G_VALUE:I = 0x4

.field public static final enum NETWORK_TYPE_5G:Lcom/example/tutorial/VideoProto$NetworkType;

.field public static final NETWORK_TYPE_5G_VALUE:I = 0x5

.field public static final enum NETWORK_TYPE_WIFI:Lcom/example/tutorial/VideoProto$NetworkType;

.field public static final NETWORK_TYPE_WIFI_VALUE:I = 0x6

.field private static final VALUES:[Lcom/example/tutorial/VideoProto$NetworkType;

.field private static internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$EnumLiteMap",
            "<",
            "Lcom/example/tutorial/VideoProto$NetworkType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final index:I

.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v5, 0x4

    const/4 v4, 0x3

    const/4 v3, 0x2

    .line 289
    new-instance v0, Lcom/example/tutorial/VideoProto$NetworkType;

    const-string v1, "NETWORK_TYPE_2G"

    .line 296
    invoke-direct {v0, v1, v6, v6, v3}, Lcom/example/tutorial/VideoProto$NetworkType;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_2G:Lcom/example/tutorial/VideoProto$NetworkType;

    .line 297
    new-instance v0, Lcom/example/tutorial/VideoProto$NetworkType;

    const-string v1, "NETWORK_TYPE_3G"

    .line 304
    invoke-direct {v0, v1, v7, v7, v4}, Lcom/example/tutorial/VideoProto$NetworkType;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_3G:Lcom/example/tutorial/VideoProto$NetworkType;

    .line 305
    new-instance v0, Lcom/example/tutorial/VideoProto$NetworkType;

    const-string v1, "NETWORK_TYPE_4G"

    .line 312
    invoke-direct {v0, v1, v3, v3, v5}, Lcom/example/tutorial/VideoProto$NetworkType;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_4G:Lcom/example/tutorial/VideoProto$NetworkType;

    .line 313
    new-instance v0, Lcom/example/tutorial/VideoProto$NetworkType;

    const-string v1, "NETWORK_TYPE_5G"

    .line 320
    const/4 v2, 0x5

    invoke-direct {v0, v1, v4, v4, v2}, Lcom/example/tutorial/VideoProto$NetworkType;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_5G:Lcom/example/tutorial/VideoProto$NetworkType;

    .line 321
    new-instance v0, Lcom/example/tutorial/VideoProto$NetworkType;

    const-string v1, "NETWORK_TYPE_WIFI"

    .line 328
    const/4 v2, 0x6

    invoke-direct {v0, v1, v5, v5, v2}, Lcom/example/tutorial/VideoProto$NetworkType;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_WIFI:Lcom/example/tutorial/VideoProto$NetworkType;

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/example/tutorial/VideoProto$NetworkType;

    sget-object v1, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_2G:Lcom/example/tutorial/VideoProto$NetworkType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_3G:Lcom/example/tutorial/VideoProto$NetworkType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_4G:Lcom/example/tutorial/VideoProto$NetworkType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_5G:Lcom/example/tutorial/VideoProto$NetworkType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_WIFI:Lcom/example/tutorial/VideoProto$NetworkType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->ENUM$VALUES:[Lcom/example/tutorial/VideoProto$NetworkType;

    .line 392
    new-instance v0, Lcom/example/tutorial/VideoProto$NetworkType$1;

    invoke-direct {v0}, Lcom/example/tutorial/VideoProto$NetworkType$1;-><init>()V

    .line 391
    sput-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    .line 411
    invoke-static {}, Lcom/example/tutorial/VideoProto$NetworkType;->values()[Lcom/example/tutorial/VideoProto$NetworkType;

    move-result-object v0

    sput-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->VALUES:[Lcom/example/tutorial/VideoProto$NetworkType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;III)V
    .locals 0
    .param p3, "index"    # I
    .param p4, "value"    # I

    .prologue
    .line 425
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 426
    iput p3, p0, Lcom/example/tutorial/VideoProto$NetworkType;->index:I

    .line 427
    iput p4, p0, Lcom/example/tutorial/VideoProto$NetworkType;->value:I

    .line 428
    return-void
.end method

.method public static final getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;
    .locals 2

    .prologue
    .line 408
    invoke-static {}, Lcom/example/tutorial/VideoProto;->getDescriptor()Lcom/google/protobuf/Descriptors$FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$FileDescriptor;->getEnumTypes()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x2

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
            "Lcom/example/tutorial/VideoProto$NetworkType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 388
    sget-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    return-object v0
.end method

.method public static valueOf(I)Lcom/example/tutorial/VideoProto$NetworkType;
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 376
    packed-switch p0, :pswitch_data_0

    .line 382
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 377
    :pswitch_0
    sget-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_2G:Lcom/example/tutorial/VideoProto$NetworkType;

    goto :goto_0

    .line 378
    :pswitch_1
    sget-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_3G:Lcom/example/tutorial/VideoProto$NetworkType;

    goto :goto_0

    .line 379
    :pswitch_2
    sget-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_4G:Lcom/example/tutorial/VideoProto$NetworkType;

    goto :goto_0

    .line 380
    :pswitch_3
    sget-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_5G:Lcom/example/tutorial/VideoProto$NetworkType;

    goto :goto_0

    .line 381
    :pswitch_4
    sget-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->NETWORK_TYPE_WIFI:Lcom/example/tutorial/VideoProto$NetworkType;

    goto :goto_0

    .line 376
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public static valueOf(Lcom/google/protobuf/Descriptors$EnumValueDescriptor;)Lcom/example/tutorial/VideoProto$NetworkType;
    .locals 2
    .param p0, "desc"    # Lcom/google/protobuf/Descriptors$EnumValueDescriptor;

    .prologue
    .line 415
    invoke-virtual {p0}, Lcom/google/protobuf/Descriptors$EnumValueDescriptor;->getType()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v0

    invoke-static {}, Lcom/example/tutorial/VideoProto$NetworkType;->getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 416
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 417
    const-string v1, "EnumValueDescriptor is not for this type."

    .line 416
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 419
    :cond_0
    sget-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->VALUES:[Lcom/example/tutorial/VideoProto$NetworkType;

    invoke-virtual {p0}, Lcom/google/protobuf/Descriptors$EnumValueDescriptor;->getIndex()I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/example/tutorial/VideoProto$NetworkType;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/example/tutorial/VideoProto$NetworkType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/example/tutorial/VideoProto$NetworkType;

    return-object v0
.end method

.method public static values()[Lcom/example/tutorial/VideoProto$NetworkType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/example/tutorial/VideoProto$NetworkType;->ENUM$VALUES:[Lcom/example/tutorial/VideoProto$NetworkType;

    array-length v1, v0

    new-array v2, v1, [Lcom/example/tutorial/VideoProto$NetworkType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public final getDescriptorForType()Lcom/google/protobuf/Descriptors$EnumDescriptor;
    .locals 1

    .prologue
    .line 404
    invoke-static {}, Lcom/example/tutorial/VideoProto$NetworkType;->getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public final getNumber()I
    .locals 1

    .prologue
    .line 373
    iget v0, p0, Lcom/example/tutorial/VideoProto$NetworkType;->value:I

    return v0
.end method

.method public final getValueDescriptor()Lcom/google/protobuf/Descriptors$EnumValueDescriptor;
    .locals 2

    .prologue
    .line 400
    invoke-static {}, Lcom/example/tutorial/VideoProto$NetworkType;->getDescriptor()Lcom/google/protobuf/Descriptors$EnumDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/protobuf/Descriptors$EnumDescriptor;->getValues()Ljava/util/List;

    move-result-object v0

    iget v1, p0, Lcom/example/tutorial/VideoProto$NetworkType;->index:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/protobuf/Descriptors$EnumValueDescriptor;

    return-object v0
.end method
