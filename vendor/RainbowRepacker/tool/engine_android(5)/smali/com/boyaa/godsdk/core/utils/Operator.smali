.class public final enum Lcom/boyaa/godsdk/core/utils/Operator;
.super Ljava/lang/Enum;
.source "Operator.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/boyaa/godsdk/core/utils/Operator;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum ChinaMobile:Lcom/boyaa/godsdk/core/utils/Operator;

.field public static final enum ChinaTelecom:Lcom/boyaa/godsdk/core/utils/Operator;

.field public static final enum ChinaUnion:Lcom/boyaa/godsdk/core/utils/Operator;

.field private static final synthetic ENUM$VALUES:[Lcom/boyaa/godsdk/core/utils/Operator;

.field public static final enum MalaysiaCelcom:Lcom/boyaa/godsdk/core/utils/Operator;

.field public static final enum MalaysiaDiGi:Lcom/boyaa/godsdk/core/utils/Operator;

.field public static final enum MalaysiaMaxis:Lcom/boyaa/godsdk/core/utils/Operator;

.field public static final enum NoneSimCard:Lcom/boyaa/godsdk/core/utils/Operator;

.field public static final enum TaiwanDaGeDa:Lcom/boyaa/godsdk/core/utils/Operator;

.field public static final enum TaiwanWeiBao:Lcom/boyaa/godsdk/core/utils/Operator;

.field public static final enum TaiwanYaTai:Lcom/boyaa/godsdk/core/utils/Operator;

.field public static final enum TaiwanYuanChuan:Lcom/boyaa/godsdk/core/utils/Operator;

.field public static final enum TaiwanZhongHua:Lcom/boyaa/godsdk/core/utils/Operator;

.field public static final enum ThailandAis:Lcom/boyaa/godsdk/core/utils/Operator;

.field public static final enum ThailandDtac:Lcom/boyaa/godsdk/core/utils/Operator;

.field public static final enum ThailandTrueMove:Lcom/boyaa/godsdk/core/utils/Operator;

.field public static final enum UnknownOperator:Lcom/boyaa/godsdk/core/utils/Operator;

.field public static final enum Wifi:Lcom/boyaa/godsdk/core/utils/Operator;

.field private static mccmncMap:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/boyaa/godsdk/core/utils/Operator;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final idInServer:I

.field private final mccmncNumbers:[I

.field public final operatorName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .prologue
    const/4 v15, 0x4

    const/4 v14, 0x1

    const/4 v13, 0x3

    const/4 v12, 0x2

    const/4 v2, 0x0

    .line 11
    new-instance v0, Lcom/boyaa/godsdk/core/utils/Operator;

    const-string v1, "NoneSimCard"

    const/4 v3, -0x1

    const-string v4, "\u65e0\u5361"

    new-array v5, v14, [I

    const/4 v6, -0x1

    aput v6, v5, v2

    invoke-direct/range {v0 .. v5}, Lcom/boyaa/godsdk/core/utils/Operator;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v0, Lcom/boyaa/godsdk/core/utils/Operator;->NoneSimCard:Lcom/boyaa/godsdk/core/utils/Operator;

    .line 12
    new-instance v3, Lcom/boyaa/godsdk/core/utils/Operator;

    const-string v4, "Wifi"

    const-string v7, "WiFi"

    new-array v8, v14, [I

    aput v2, v8, v2

    move v5, v14

    move v6, v2

    invoke-direct/range {v3 .. v8}, Lcom/boyaa/godsdk/core/utils/Operator;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->Wifi:Lcom/boyaa/godsdk/core/utils/Operator;

    .line 13
    new-instance v3, Lcom/boyaa/godsdk/core/utils/Operator;

    const-string v4, "UnknownOperator"

    const/16 v6, 0x9

    const-string v7, "\u5176\u4ed6\u8fd0\u8425\u5546"

    new-array v8, v2, [I

    move v5, v12

    invoke-direct/range {v3 .. v8}, Lcom/boyaa/godsdk/core/utils/Operator;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->UnknownOperator:Lcom/boyaa/godsdk/core/utils/Operator;

    .line 14
    new-instance v3, Lcom/boyaa/godsdk/core/utils/Operator;

    const-string v4, "ChinaMobile"

    const-string v7, "\u4e2d\u56fd\u79fb\u52a8"

    new-array v8, v13, [I

    fill-array-data v8, :array_0

    move v5, v13

    move v6, v14

    invoke-direct/range {v3 .. v8}, Lcom/boyaa/godsdk/core/utils/Operator;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->ChinaMobile:Lcom/boyaa/godsdk/core/utils/Operator;

    .line 15
    new-instance v3, Lcom/boyaa/godsdk/core/utils/Operator;

    const-string v4, "ChinaUnion"

    const-string v7, "\u4e2d\u56fd\u8054\u901a"

    new-array v8, v13, [I

    fill-array-data v8, :array_1

    move v5, v15

    move v6, v12

    invoke-direct/range {v3 .. v8}, Lcom/boyaa/godsdk/core/utils/Operator;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->ChinaUnion:Lcom/boyaa/godsdk/core/utils/Operator;

    .line 16
    new-instance v3, Lcom/boyaa/godsdk/core/utils/Operator;

    const-string v4, "ChinaTelecom"

    const/4 v5, 0x5

    const-string v7, "\u4e2d\u56fd\u7535\u4fe1"

    new-array v8, v12, [I

    fill-array-data v8, :array_2

    move v6, v13

    invoke-direct/range {v3 .. v8}, Lcom/boyaa/godsdk/core/utils/Operator;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->ChinaTelecom:Lcom/boyaa/godsdk/core/utils/Operator;

    .line 17
    new-instance v3, Lcom/boyaa/godsdk/core/utils/Operator;

    const-string v4, "TaiwanDaGeDa"

    const/4 v5, 0x6

    const-string v7, "\u53f0\u6e7e\u5927\u54e5\u5927"

    new-array v8, v13, [I

    fill-array-data v8, :array_3

    move v6, v15

    invoke-direct/range {v3 .. v8}, Lcom/boyaa/godsdk/core/utils/Operator;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->TaiwanDaGeDa:Lcom/boyaa/godsdk/core/utils/Operator;

    .line 18
    new-instance v3, Lcom/boyaa/godsdk/core/utils/Operator;

    const-string v4, "TaiwanYuanChuan"

    const/4 v5, 0x7

    const/4 v6, 0x5

    const-string v7, "\u8fdc\u4f20\u7535\u4fe1"

    new-array v8, v13, [I

    fill-array-data v8, :array_4

    invoke-direct/range {v3 .. v8}, Lcom/boyaa/godsdk/core/utils/Operator;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->TaiwanYuanChuan:Lcom/boyaa/godsdk/core/utils/Operator;

    .line 19
    new-instance v3, Lcom/boyaa/godsdk/core/utils/Operator;

    const-string v4, "TaiwanWeiBao"

    const/16 v5, 0x8

    const/4 v6, 0x6

    const-string v7, "\u5a01\u5b9d\u7535\u4fe1"

    new-array v8, v14, [I

    const v0, 0xb661

    aput v0, v8, v2

    invoke-direct/range {v3 .. v8}, Lcom/boyaa/godsdk/core/utils/Operator;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->TaiwanWeiBao:Lcom/boyaa/godsdk/core/utils/Operator;

    .line 20
    new-instance v3, Lcom/boyaa/godsdk/core/utils/Operator;

    const-string v4, "TaiwanYaTai"

    const/16 v5, 0x9

    const/4 v6, 0x7

    const-string v7, "\u4e9a\u592a\u7535\u4fe1"

    new-array v8, v14, [I

    const v0, 0xb60d

    aput v0, v8, v2

    invoke-direct/range {v3 .. v8}, Lcom/boyaa/godsdk/core/utils/Operator;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->TaiwanYaTai:Lcom/boyaa/godsdk/core/utils/Operator;

    .line 21
    new-instance v3, Lcom/boyaa/godsdk/core/utils/Operator;

    const-string v4, "TaiwanZhongHua"

    const/16 v5, 0xa

    const/16 v6, 0x8

    const-string v7, "\u4e2d\u534e\u7535\u4fe1"

    new-array v8, v12, [I

    fill-array-data v8, :array_5

    invoke-direct/range {v3 .. v8}, Lcom/boyaa/godsdk/core/utils/Operator;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->TaiwanZhongHua:Lcom/boyaa/godsdk/core/utils/Operator;

    .line 22
    new-instance v3, Lcom/boyaa/godsdk/core/utils/Operator;

    const-string v4, "MalaysiaMaxis"

    const/16 v5, 0xb

    sget-object v0, Lcom/boyaa/godsdk/core/utils/Operator;->UnknownOperator:Lcom/boyaa/godsdk/core/utils/Operator;

    iget v6, v0, Lcom/boyaa/godsdk/core/utils/Operator;->idInServer:I

    const-string v7, "Maxis"

    new-array v8, v12, [I

    fill-array-data v8, :array_6

    invoke-direct/range {v3 .. v8}, Lcom/boyaa/godsdk/core/utils/Operator;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->MalaysiaMaxis:Lcom/boyaa/godsdk/core/utils/Operator;

    .line 23
    new-instance v3, Lcom/boyaa/godsdk/core/utils/Operator;

    const-string v4, "MalaysiaCelcom"

    const/16 v5, 0xc

    sget-object v0, Lcom/boyaa/godsdk/core/utils/Operator;->UnknownOperator:Lcom/boyaa/godsdk/core/utils/Operator;

    iget v6, v0, Lcom/boyaa/godsdk/core/utils/Operator;->idInServer:I

    const-string v7, "Celcom"

    new-array v8, v12, [I

    fill-array-data v8, :array_7

    invoke-direct/range {v3 .. v8}, Lcom/boyaa/godsdk/core/utils/Operator;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->MalaysiaCelcom:Lcom/boyaa/godsdk/core/utils/Operator;

    .line 24
    new-instance v3, Lcom/boyaa/godsdk/core/utils/Operator;

    const-string v4, "MalaysiaDiGi"

    const/16 v5, 0xd

    sget-object v0, Lcom/boyaa/godsdk/core/utils/Operator;->UnknownOperator:Lcom/boyaa/godsdk/core/utils/Operator;

    iget v6, v0, Lcom/boyaa/godsdk/core/utils/Operator;->idInServer:I

    const-string v7, "DiGi"

    new-array v8, v12, [I

    fill-array-data v8, :array_8

    invoke-direct/range {v3 .. v8}, Lcom/boyaa/godsdk/core/utils/Operator;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->MalaysiaDiGi:Lcom/boyaa/godsdk/core/utils/Operator;

    .line 25
    new-instance v3, Lcom/boyaa/godsdk/core/utils/Operator;

    const-string v4, "ThailandAis"

    const/16 v5, 0xe

    sget-object v0, Lcom/boyaa/godsdk/core/utils/Operator;->UnknownOperator:Lcom/boyaa/godsdk/core/utils/Operator;

    iget v6, v0, Lcom/boyaa/godsdk/core/utils/Operator;->idInServer:I

    const-string v7, "AIS"

    new-array v8, v13, [I

    fill-array-data v8, :array_9

    invoke-direct/range {v3 .. v8}, Lcom/boyaa/godsdk/core/utils/Operator;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->ThailandAis:Lcom/boyaa/godsdk/core/utils/Operator;

    .line 26
    new-instance v3, Lcom/boyaa/godsdk/core/utils/Operator;

    const-string v4, "ThailandDtac"

    const/16 v5, 0xf

    sget-object v0, Lcom/boyaa/godsdk/core/utils/Operator;->UnknownOperator:Lcom/boyaa/godsdk/core/utils/Operator;

    iget v6, v0, Lcom/boyaa/godsdk/core/utils/Operator;->idInServer:I

    const-string v7, "DTAC"

    new-array v8, v12, [I

    fill-array-data v8, :array_a

    invoke-direct/range {v3 .. v8}, Lcom/boyaa/godsdk/core/utils/Operator;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->ThailandDtac:Lcom/boyaa/godsdk/core/utils/Operator;

    .line 27
    new-instance v3, Lcom/boyaa/godsdk/core/utils/Operator;

    const-string v4, "ThailandTrueMove"

    const/16 v5, 0x10

    sget-object v0, Lcom/boyaa/godsdk/core/utils/Operator;->UnknownOperator:Lcom/boyaa/godsdk/core/utils/Operator;

    iget v6, v0, Lcom/boyaa/godsdk/core/utils/Operator;->idInServer:I

    const-string v7, "TrueMove"

    new-array v8, v13, [I

    fill-array-data v8, :array_b

    invoke-direct/range {v3 .. v8}, Lcom/boyaa/godsdk/core/utils/Operator;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->ThailandTrueMove:Lcom/boyaa/godsdk/core/utils/Operator;

    const/16 v0, 0x11

    new-array v0, v0, [Lcom/boyaa/godsdk/core/utils/Operator;

    sget-object v1, Lcom/boyaa/godsdk/core/utils/Operator;->NoneSimCard:Lcom/boyaa/godsdk/core/utils/Operator;

    aput-object v1, v0, v2

    sget-object v1, Lcom/boyaa/godsdk/core/utils/Operator;->Wifi:Lcom/boyaa/godsdk/core/utils/Operator;

    aput-object v1, v0, v14

    sget-object v1, Lcom/boyaa/godsdk/core/utils/Operator;->UnknownOperator:Lcom/boyaa/godsdk/core/utils/Operator;

    aput-object v1, v0, v12

    sget-object v1, Lcom/boyaa/godsdk/core/utils/Operator;->ChinaMobile:Lcom/boyaa/godsdk/core/utils/Operator;

    aput-object v1, v0, v13

    sget-object v1, Lcom/boyaa/godsdk/core/utils/Operator;->ChinaUnion:Lcom/boyaa/godsdk/core/utils/Operator;

    aput-object v1, v0, v15

    const/4 v1, 0x5

    sget-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->ChinaTelecom:Lcom/boyaa/godsdk/core/utils/Operator;

    aput-object v3, v0, v1

    const/4 v1, 0x6

    sget-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->TaiwanDaGeDa:Lcom/boyaa/godsdk/core/utils/Operator;

    aput-object v3, v0, v1

    const/4 v1, 0x7

    sget-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->TaiwanYuanChuan:Lcom/boyaa/godsdk/core/utils/Operator;

    aput-object v3, v0, v1

    const/16 v1, 0x8

    sget-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->TaiwanWeiBao:Lcom/boyaa/godsdk/core/utils/Operator;

    aput-object v3, v0, v1

    const/16 v1, 0x9

    sget-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->TaiwanYaTai:Lcom/boyaa/godsdk/core/utils/Operator;

    aput-object v3, v0, v1

    const/16 v1, 0xa

    sget-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->TaiwanZhongHua:Lcom/boyaa/godsdk/core/utils/Operator;

    aput-object v3, v0, v1

    const/16 v1, 0xb

    sget-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->MalaysiaMaxis:Lcom/boyaa/godsdk/core/utils/Operator;

    aput-object v3, v0, v1

    const/16 v1, 0xc

    sget-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->MalaysiaCelcom:Lcom/boyaa/godsdk/core/utils/Operator;

    aput-object v3, v0, v1

    const/16 v1, 0xd

    sget-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->MalaysiaDiGi:Lcom/boyaa/godsdk/core/utils/Operator;

    aput-object v3, v0, v1

    const/16 v1, 0xe

    sget-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->ThailandAis:Lcom/boyaa/godsdk/core/utils/Operator;

    aput-object v3, v0, v1

    const/16 v1, 0xf

    sget-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->ThailandDtac:Lcom/boyaa/godsdk/core/utils/Operator;

    aput-object v3, v0, v1

    const/16 v1, 0x10

    sget-object v3, Lcom/boyaa/godsdk/core/utils/Operator;->ThailandTrueMove:Lcom/boyaa/godsdk/core/utils/Operator;

    aput-object v3, v0, v1

    sput-object v0, Lcom/boyaa/godsdk/core/utils/Operator;->ENUM$VALUES:[Lcom/boyaa/godsdk/core/utils/Operator;

    .line 35
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/boyaa/godsdk/core/utils/Operator;->mccmncMap:Landroid/util/SparseArray;

    .line 37
    invoke-static {}, Lcom/boyaa/godsdk/core/utils/Operator;->values()[Lcom/boyaa/godsdk/core/utils/Operator;

    move-result-object v9

    .line 38
    .local v9, "all":[Lcom/boyaa/godsdk/core/utils/Operator;
    array-length v3, v9

    move v1, v2

    :goto_0
    if-lt v1, v3, :cond_0

    .line 43
    return-void

    .line 38
    :cond_0
    aget-object v11, v9, v1

    .line 39
    .local v11, "operator":Lcom/boyaa/godsdk/core/utils/Operator;
    iget-object v4, v11, Lcom/boyaa/godsdk/core/utils/Operator;->mccmncNumbers:[I

    array-length v5, v4

    move v0, v2

    :goto_1
    if-lt v0, v5, :cond_1

    .line 38
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 39
    :cond_1
    aget v10, v4, v0

    .line 40
    .local v10, "mccmnc":I
    sget-object v6, Lcom/boyaa/godsdk/core/utils/Operator;->mccmncMap:Landroid/util/SparseArray;

    invoke-virtual {v6, v10, v11}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 39
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 14
    :array_0
    .array-data 4
        0xb3b0
        0xb3b2
        0xb3b7
    .end array-data

    .line 15
    :array_1
    .array-data 4
        0xb3b1
        0xb3b6
        0xb3b9
    .end array-data

    .line 16
    :array_2
    .array-data 4
        0xb3b3
        0xb3b5
    .end array-data

    .line 17
    :array_3
    .array-data 4
        0xb665
        0xb669
        0xb66b
    .end array-data

    .line 18
    :array_4
    .array-data 4
        0xb609
        0xb60e
        0xb660
    .end array-data

    .line 21
    :array_5
    .array-data 4
        0xb613
        0xb664
    .end array-data

    .line 22
    :array_6
    .array-data 4
        0xc424
        0xc429
    .end array-data

    .line 23
    :array_7
    .array-data 4
        0xc425
        0xc42b
    .end array-data

    .line 24
    :array_8
    .array-data 4
        0xc422
        0xc428
    .end array-data

    .line 25
    :array_9
    .array-data 4
        0xcb21
        0xcb23
        0xcb37
    .end array-data

    .line 26
    :array_a
    .array-data 4
        0xcb25
        0xcb32
    .end array-data

    .line 27
    :array_b
    .array-data 4
        0xcb24
        0xcb83
        0xcb20
    .end array-data
.end method

.method private varargs constructor <init>(Ljava/lang/String;IILjava/lang/String;[I)V
    .locals 0
    .param p3, "operatorId"    # I
    .param p4, "name"    # Ljava/lang/String;
    .param p5, "mccmncNumbers"    # [I

    .prologue
    .line 52
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 53
    iput p3, p0, Lcom/boyaa/godsdk/core/utils/Operator;->idInServer:I

    .line 54
    iput-object p4, p0, Lcom/boyaa/godsdk/core/utils/Operator;->operatorName:Ljava/lang/String;

    .line 55
    iput-object p5, p0, Lcom/boyaa/godsdk/core/utils/Operator;->mccmncNumbers:[I

    .line 56
    return-void
.end method

.method public static getCurrentOperator(Landroid/content/Context;)Lcom/boyaa/godsdk/core/utils/Operator;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 59
    invoke-static {p0}, Lcom/boyaa/godsdk/core/utils/SimUtils;->getMccMncNumber(Landroid/content/Context;)I

    move-result v0

    invoke-static {p0, v0}, Lcom/boyaa/godsdk/core/utils/Operator;->getCurrentOperatorByMccMnc(Landroid/content/Context;I)Lcom/boyaa/godsdk/core/utils/Operator;

    move-result-object v0

    return-object v0
.end method

.method public static getCurrentOperatorByMccMnc(Landroid/content/Context;I)Lcom/boyaa/godsdk/core/utils/Operator;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "mccmnc"    # I

    .prologue
    .line 63
    if-gez p1, :cond_1

    .line 64
    sget-object v0, Lcom/boyaa/godsdk/core/utils/Operator;->NoneSimCard:Lcom/boyaa/godsdk/core/utils/Operator;

    .line 70
    :cond_0
    :goto_0
    return-object v0

    .line 66
    :cond_1
    sget-object v1, Lcom/boyaa/godsdk/core/utils/Operator;->mccmncMap:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/boyaa/godsdk/core/utils/Operator;

    .line 67
    .local v0, "operator":Lcom/boyaa/godsdk/core/utils/Operator;
    if-nez v0, :cond_0

    .line 68
    sget-object v0, Lcom/boyaa/godsdk/core/utils/Operator;->UnknownOperator:Lcom/boyaa/godsdk/core/utils/Operator;

    goto :goto_0
.end method

.method private static getOperatorByServerId(I)Lcom/boyaa/godsdk/core/utils/Operator;
    .locals 5
    .param p0, "id"    # I

    .prologue
    .line 85
    invoke-static {}, Lcom/boyaa/godsdk/core/utils/Operator;->values()[Lcom/boyaa/godsdk/core/utils/Operator;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v3, :cond_1

    .line 90
    const/4 v0, 0x0

    :cond_0
    return-object v0

    .line 85
    :cond_1
    aget-object v0, v2, v1

    .line 86
    .local v0, "operator":Lcom/boyaa/godsdk/core/utils/Operator;
    iget v4, v0, Lcom/boyaa/godsdk/core/utils/Operator;->idInServer:I

    if-eq v4, p0, :cond_0

    .line 85
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/boyaa/godsdk/core/utils/Operator;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/boyaa/godsdk/core/utils/Operator;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/boyaa/godsdk/core/utils/Operator;

    return-object v0
.end method

.method public static values()[Lcom/boyaa/godsdk/core/utils/Operator;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/boyaa/godsdk/core/utils/Operator;->ENUM$VALUES:[Lcom/boyaa/godsdk/core/utils/Operator;

    array-length v1, v0

    new-array v2, v1, [Lcom/boyaa/godsdk/core/utils/Operator;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public getIdInServer()I
    .locals 1

    .prologue
    .line 94
    iget v0, p0, Lcom/boyaa/godsdk/core/utils/Operator;->idInServer:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lcom/boyaa/godsdk/core/utils/Operator;->operatorName:Ljava/lang/String;

    return-object v0
.end method
