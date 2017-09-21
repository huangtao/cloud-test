.class public final enum Lcom/boyaa/godsdk/core/AdsType;
.super Ljava/lang/Enum;
.source "AdsType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/boyaa/godsdk/core/AdsType;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum AD_TYPE_BANNER:Lcom/boyaa/godsdk/core/AdsType;

.field public static final enum AD_TYPE_FULLSCREEN:Lcom/boyaa/godsdk/core/AdsType;

.field public static final enum AD_TYPE_MOREAPP:Lcom/boyaa/godsdk/core/AdsType;

.field public static final enum AD_TYPE_OFFERWALL:Lcom/boyaa/godsdk/core/AdsType;

.field private static final synthetic ENUM$VALUES:[Lcom/boyaa/godsdk/core/AdsType;


# instance fields
.field private mType:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 4
    new-instance v0, Lcom/boyaa/godsdk/core/AdsType;

    const-string v1, "AD_TYPE_BANNER"

    .line 7
    invoke-direct {v0, v1, v2, v2}, Lcom/boyaa/godsdk/core/AdsType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/boyaa/godsdk/core/AdsType;->AD_TYPE_BANNER:Lcom/boyaa/godsdk/core/AdsType;

    .line 8
    new-instance v0, Lcom/boyaa/godsdk/core/AdsType;

    const-string v1, "AD_TYPE_FULLSCREEN"

    .line 11
    invoke-direct {v0, v1, v3, v3}, Lcom/boyaa/godsdk/core/AdsType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/boyaa/godsdk/core/AdsType;->AD_TYPE_FULLSCREEN:Lcom/boyaa/godsdk/core/AdsType;

    .line 12
    new-instance v0, Lcom/boyaa/godsdk/core/AdsType;

    const-string v1, "AD_TYPE_MOREAPP"

    .line 15
    invoke-direct {v0, v1, v4, v4}, Lcom/boyaa/godsdk/core/AdsType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/boyaa/godsdk/core/AdsType;->AD_TYPE_MOREAPP:Lcom/boyaa/godsdk/core/AdsType;

    .line 16
    new-instance v0, Lcom/boyaa/godsdk/core/AdsType;

    const-string v1, "AD_TYPE_OFFERWALL"

    .line 19
    invoke-direct {v0, v1, v5, v5}, Lcom/boyaa/godsdk/core/AdsType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/boyaa/godsdk/core/AdsType;->AD_TYPE_OFFERWALL:Lcom/boyaa/godsdk/core/AdsType;

    .line 3
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/boyaa/godsdk/core/AdsType;

    sget-object v1, Lcom/boyaa/godsdk/core/AdsType;->AD_TYPE_BANNER:Lcom/boyaa/godsdk/core/AdsType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/boyaa/godsdk/core/AdsType;->AD_TYPE_FULLSCREEN:Lcom/boyaa/godsdk/core/AdsType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/boyaa/godsdk/core/AdsType;->AD_TYPE_MOREAPP:Lcom/boyaa/godsdk/core/AdsType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/boyaa/godsdk/core/AdsType;->AD_TYPE_OFFERWALL:Lcom/boyaa/godsdk/core/AdsType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/boyaa/godsdk/core/AdsType;->ENUM$VALUES:[Lcom/boyaa/godsdk/core/AdsType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "type"    # I

    .prologue
    .line 21
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 22
    iput p3, p0, Lcom/boyaa/godsdk/core/AdsType;->mType:I

    .line 23
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/boyaa/godsdk/core/AdsType;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/boyaa/godsdk/core/AdsType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/boyaa/godsdk/core/AdsType;

    return-object v0
.end method

.method public static values()[Lcom/boyaa/godsdk/core/AdsType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/boyaa/godsdk/core/AdsType;->ENUM$VALUES:[Lcom/boyaa/godsdk/core/AdsType;

    array-length v1, v0

    new-array v2, v1, [Lcom/boyaa/godsdk/core/AdsType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public getType()I
    .locals 1

    .prologue
    .line 25
    iget v0, p0, Lcom/boyaa/godsdk/core/AdsType;->mType:I

    return v0
.end method

.method public getTypeString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/AdsType;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
