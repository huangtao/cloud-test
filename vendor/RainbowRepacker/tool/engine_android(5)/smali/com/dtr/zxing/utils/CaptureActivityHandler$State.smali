.class final enum Lcom/dtr/zxing/utils/CaptureActivityHandler$State;
.super Ljava/lang/Enum;
.source "CaptureActivityHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dtr/zxing/utils/CaptureActivityHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/dtr/zxing/utils/CaptureActivityHandler$State;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum DONE:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

.field private static final synthetic ENUM$VALUES:[Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

.field public static final enum PREVIEW:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

.field public static final enum SUCCESS:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 29
    new-instance v0, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    const-string v1, "PREVIEW"

    invoke-direct {v0, v1, v2}, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;->PREVIEW:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    new-instance v0, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    const-string v1, "SUCCESS"

    invoke-direct {v0, v1, v3}, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;->SUCCESS:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    new-instance v0, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    const-string v1, "DONE"

    invoke-direct {v0, v1, v4}, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;->DONE:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    .line 28
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    sget-object v1, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;->PREVIEW:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    aput-object v1, v0, v2

    sget-object v1, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;->SUCCESS:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    aput-object v1, v0, v3

    sget-object v1, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;->DONE:Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    aput-object v1, v0, v4

    sput-object v0, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;->ENUM$VALUES:[Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dtr/zxing/utils/CaptureActivityHandler$State;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    return-object v0
.end method

.method public static values()[Lcom/dtr/zxing/utils/CaptureActivityHandler$State;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/dtr/zxing/utils/CaptureActivityHandler$State;->ENUM$VALUES:[Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    array-length v1, v0

    new-array v2, v1, [Lcom/dtr/zxing/utils/CaptureActivityHandler$State;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
