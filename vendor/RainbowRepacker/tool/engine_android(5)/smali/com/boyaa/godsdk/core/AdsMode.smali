.class public final enum Lcom/boyaa/godsdk/core/AdsMode;
.super Ljava/lang/Enum;
.source "AdsMode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/boyaa/godsdk/core/AdsMode;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum ADS_MODE_EXIT:Lcom/boyaa/godsdk/core/AdsMode;

.field public static final enum ADS_MODE_PAUSE:Lcom/boyaa/godsdk/core/AdsMode;

.field private static final synthetic ENUM$VALUES:[Lcom/boyaa/godsdk/core/AdsMode;


# instance fields
.field private mMode:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 6
    new-instance v0, Lcom/boyaa/godsdk/core/AdsMode;

    const-string v1, "ADS_MODE_PAUSE"

    .line 9
    invoke-direct {v0, v1, v2, v2}, Lcom/boyaa/godsdk/core/AdsMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/boyaa/godsdk/core/AdsMode;->ADS_MODE_PAUSE:Lcom/boyaa/godsdk/core/AdsMode;

    .line 10
    new-instance v0, Lcom/boyaa/godsdk/core/AdsMode;

    const-string v1, "ADS_MODE_EXIT"

    .line 13
    invoke-direct {v0, v1, v3, v3}, Lcom/boyaa/godsdk/core/AdsMode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/boyaa/godsdk/core/AdsMode;->ADS_MODE_EXIT:Lcom/boyaa/godsdk/core/AdsMode;

    .line 5
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/boyaa/godsdk/core/AdsMode;

    sget-object v1, Lcom/boyaa/godsdk/core/AdsMode;->ADS_MODE_PAUSE:Lcom/boyaa/godsdk/core/AdsMode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/boyaa/godsdk/core/AdsMode;->ADS_MODE_EXIT:Lcom/boyaa/godsdk/core/AdsMode;

    aput-object v1, v0, v3

    sput-object v0, Lcom/boyaa/godsdk/core/AdsMode;->ENUM$VALUES:[Lcom/boyaa/godsdk/core/AdsMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "type"    # I

    .prologue
    .line 16
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 17
    iput p3, p0, Lcom/boyaa/godsdk/core/AdsMode;->mMode:I

    .line 18
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/boyaa/godsdk/core/AdsMode;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/boyaa/godsdk/core/AdsMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/boyaa/godsdk/core/AdsMode;

    return-object v0
.end method

.method public static values()[Lcom/boyaa/godsdk/core/AdsMode;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/boyaa/godsdk/core/AdsMode;->ENUM$VALUES:[Lcom/boyaa/godsdk/core/AdsMode;

    array-length v1, v0

    new-array v2, v1, [Lcom/boyaa/godsdk/core/AdsMode;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public getModeString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    invoke-virtual {p0}, Lcom/boyaa/godsdk/core/AdsMode;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 20
    iget v0, p0, Lcom/boyaa/godsdk/core/AdsMode;->mMode:I

    return v0
.end method
